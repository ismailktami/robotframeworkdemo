*** Settings ***
Library     Browser
Library     SeleniumLibrary
Library     BuiltIn

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

*** Test Cases ***
Test
   [Tags]  TXRAY-1122
   SeleniumLibrary.Open Browser    url=${url_ixina}   browser=chrome
   SeleniumLibrary.Maximize Browser Window
   SeleniumLibrary.Wait Until Element Is Visible    ${accept_cookies_btn}    30s
   SeleniumLibrary.Click Element   ${accept_cookies_btn}
   SeleniumLibrary.Wait Until Element Is Visible    ${close_popup_btn}    30s
   Sleep    2s
   SeleniumLibrary.Click Element   ${close_popup_btn} 