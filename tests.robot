*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     String
*** Variables ***
${url_ixina}      https://www.ixina.fr/
${accept_cookies_btn}   //*[@id='onetrust-accept-btn-handler']
${main_content}     //*[@id='main-content']
${close_popup_btn}  //button[@class="ab_widget_container_popin-image_close_button"]
${go_to_searchpage}     //*[@id="main-navigation"]/div/div[3]/nav/ul/li[1]/a
${input_search}     //*[@id="main-content"]//*[@id="tx-solr-search-form-pi-results"]/div/input
${search_btn}   //form[@id="tx-solr-search-form-pi-results"]//button[contains(@class,'tx-solr-submit')]
${result_count}     //span[@class="results-count"]
${load_more_btn}    //button[contains(@class,'load-more')]
${mon_espace}   //a[@title="Mon espace"]
${new_appointment}  //a[contains(@class,'new-appointment')]

*** Keywords ***
Open Chrome
    # DISABLE DEFAULT CAPTURE IF FAILED, SET CAPTURE WITH GOOD FILENAME IN TEARDOWN
    SeleniumLibrary.Register Keyword To Run On Failure    NONE
    # SET CHROME BINARY
    # SET CHROME OPTIONS
    ${options}=    BuiltIn.Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --test-type
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    # AUTOMATICALY DEFAULT DOWNLOAD DIRECTORY
	${prefs}    Create Dictionary    download.default_directory=${OUTPUT DIR}    profile.default_content_settings.popups=${0}    profile.default_content_setting_values.notifications=${2}
	Call Method    ${options}    add_experimental_option    prefs    ${prefs}  
	# DISABLE POPUP CHROME CONTROLED BY AUTOMATION TOOLS
	Call Method    ${options}    add_experimental_option    useAutomationExtension    ${False}
    ${excluded}    Create List    enable-automation   enable-logging
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${excluded}
    # SET CHROME PORTABLE BINARY
    # START DRIVER
    SeleniumLibrary.Create Webdriver    Chrome    chrome_options=${options} 
    SeleniumLibrary.Set Selenium Timeout    60s
    SeleniumLibrary.Set Selenium Implicit Wait    30s  
    SeleniumLibrary.Maximize Browser Window     

*** Test Cases ***
Test
   [Tags]  TXRAY-1122
   Open Chrome
   Go to    url=${url_ixina}
   SeleniumLibrary.Maximize Browser Window
   SeleniumLibrary.Wait Until Element Is Visible    ${accept_cookies_btn}    30s
   SeleniumLibrary.Click Element   ${accept_cookies_btn}
   SeleniumLibrary.Wait Until Element Is Visible    ${close_popup_btn}    30s
   Sleep    2s
   SeleniumLibrary.Click Element   ${close_popup_btn} 
