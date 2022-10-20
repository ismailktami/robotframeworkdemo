from os import error
from Constants import URL_PROJECT
import requests
import json
from  PublisherReport  import PublisherReport
from Logger import logger
import base64
global headers
headers = {
    'Authorization': 'Basic OmFhMzNnZmR6YmI0bWliZmNscXdxc2c1MmJ5Z3JyZms1djQzYWx4b2Rodm1qcHViN2U0NXE=',
    'Content-Type': 'application/json'
}

class AzureApiPlans:
    def __init__(self,azure_url_project=URL_PROJECT,version='6.0-preview.2'):
        self.version = version
        self.azure_url_project = azure_url_project

    def get_tests_points(self, testcases):
        logger.info('\n'+str(self.__class__)+'get_tests_points')
        print(testcases)
        url = self.azure_url_project+"/test/points?api-version="+self.version
        payload = json.dumps({
            "PointsFilter": {
                "TestcaseIds": testcases
            }
        })
        response = requests.request("POST", url, headers=headers, data=payload)
        print(response.content)
        return response.json()["points"]

    def get_testscases(self,testplandId,suiteId):
        url = self.azure_url_project+"/testplan/Plans/"+str(testplandId)+"/Suites/"+str(suiteId)+"/TestPoint/?api-version="+self.version
        response = requests.request("GET", url, headers=headers)

    def update_testspoints_outcomes(self,testplanId,suiteId,testspoints):
        print('\n',self.__class__,'update_testspoints_outcomes')
        url = self.azure_url_project+"/testplan/Plans/"+testplanId+"/Suites/"+suiteId+"/TestPoint?api-version="+self.version
        payload = json.dumps(testspoints)
        response = requests.request("PATCH", url, headers=headers, data=payload)

            

    def create_run(self,planId,suite_name,starttime,endtime,run_by):
        print("create_run")
        logger.info('\n'+str(self.__class__)+'create_run')
        url = self.azure_url_project+"/test/runs?api-version="+self.version
        payload = json.dumps({
        "name": suite_name,
        "startDate": starttime,
        "completeDate": endtime,
        "state": "InProgress",
        "plan": {
            "id": planId,
            "url":self.azure_url_project.split("_apis")[0]+"_testPlans/define?planId="+str(planId)
        },
        "automated": True,
        "type": "NoConfigRun",
        "comment": "",  
        "owner":{
                    "displayName":run_by
                }
        })
        response = requests.request("POST", url, headers=headers, data=payload)
        print(response.json())
        print("RUN ID = ",response.json()['id'])
        print("RUN URL = ",response.json()['url'])
        return response.json()
        
    def add_tests_results(self,run_id,testresults,version=6.0):
        print('\n',self.__class__,'add_tests_results')
        url = self.azure_url_project+"/test/runs/"+str(run_id)+"/results?api-version="+str(version)
        payload = json.dumps(testresults)
        response = requests.request("POST", url, headers=headers, data=payload)
        if str(response.status_code).startswith('4'):
            raise Exception(str(response)+"\t"+response.reason)
        return response.json()
    
    def update_run(self,run_id,payload,version=6.0):
        print('\n',self.__class__,'update_run')
        url = self.azure_url_project+"/test/runs/"+str(run_id)+"?api-version="+str(version)
        payload = json.dumps(payload)
        response = requests.request("PATCH", url, headers=headers, data=payload)
        print(response.text)


    def publish_report_to_run(self,run_id,report_path):
        print('\n',self.__class__,'publish_report_to_run')
        publisher=PublisherReport()
        publisher.publish(run_id,report_path)

    def get_results_run(self,run_id):
        url = self.azure_url_project+"/test/Runs/"+str(run_id)+"/results?detailsToInclude=WorkItems,Iterations&api-version=6.0"
        response = requests.request("GET", url, headers=headers)
        return response.json()

    def add_attachement_to_testresult(self,run_id,test_result_id,filename):
        with open("output_dir/"+filename, "rb") as report:
            data = base64.b64encode(report.read())
        payload = json.dumps({
        "stream": str(data,'utf-8'),
        "fileName": filename,
        "comment": "Capture Page Error",
        "attachmentType": "GeneralAttachment"
        })
        response = requests.request("POST",self.azure_url_project+"/test/Runs/"+str(run_id)+"/Results/"+str(test_result_id)+"/attachments?api-version=6.0-preview.1", headers=headers, data=payload)
        