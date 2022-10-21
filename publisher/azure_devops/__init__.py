import os
import CommandParserArgs
from robot.api import ExecutionResult
from SuiteResults import SuiteResults
from AzureApiPlans import AzureApiPlans
from utils import *
from FormatterPayloadAzure import FormatterPayloadAzure
from Constants import *   
from datetime import datetime
from Logger import logger

try:
        CommandParserArgs.ParseCommandLineParameters()
        path = os.path.join(CommandParserArgs.OUTPUTDIR,'output.xml')
        print(path)
        print(CommandParserArgs.OUTPUTDIR)
        results = ExecutionResult(path)
        suitesresults = SuiteResults(CommandParserArgs.OUTPUTDIR)
        results = results.visit(suitesresults)
        azure_api=AzureApiPlans()
        for suite in suitesresults.suites:
                testpoints=azure_api.get_tests_points(suitesresults.get_testcase_ids(suite))
                testpoints=[testpoint for testpoint in testpoints if ( testpoint['testPlan']['id'] == str(suite['planId']) and testpoint['suite']['id'] == str(suite['id']))]
                if testpoints:
                        for testpoint in testpoints:
                                tc=suite['testcases'][str(testpoint['testCase']['id'])]
                                testpoint['starttime']=tc['starttime']
                                testpoint['endtime']=tc['endtime']
                                testpoint['elapsedtime']=tc['elapsedtime']
                                testpoint['critical']=tc['critical']
                                testpoint['message']=tc['message']
                                testpoint['name'] = tc['name']
                                testpoint["status"] = STATUS_RBF[tc['status']]
                else: 
                        raise Exception('There is no testpoints to pubblish outcomes')

                endtime= datetime.strptime(suite['endtime'],"%Y%m%d %H:%M:%S.%f").isoformat()
                starttime= datetime.strptime(suite['starttime'],"%Y%m%d %H:%M:%S.%f").isoformat()
                run=azure_api.create_run(suite['planId'],suite['name']+' '+str(CommandParserArgs.ENVIRONNEMENT).upper(),starttime,endtime,CommandParserArgs.USERNAME)
                payload=FormatterPayloadAzure.format_testresults_payload(testpoints)
                results=azure_api.add_tests_results(run['id'],payload)
                azure_api.update_run(run['id'],{
                "comment": NEW_LINE+"JOB ID = "+CommandParserArgs.JOB_ID+
                           NEW_LINE+"JOB URL="+CommandParserArgs.JOB_URL+
                           NEW_LINE+"JOB NAME = "+CommandParserArgs.JOB_NAME+
                           NEW_LINE+"ENVIRONNEMENT = "+CommandParserArgs.ENVIRONNEMENT,
                "state":"Completed"
                })
                eee=azure_api.get_results_run(run['id'])
                
                for result in eee['value']:
                        if result['outcome']=="Failed":
                                filename='ID-'+result["testCase"]["id"]+'_TEST_FAILED.png'
                                azure_api.add_attachement_to_testresult(run['id'],result['id'],filename)
                azure_api.publish_report_to_run(run['id'],CommandParserArgs.OUTPUTDIR)

except Exception as ex:
        logger.error("Publication de resultats AZURE KO : Exception :\n"+str(ex))