*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${username_input}   //input[@name="email"]
${password_inpuit}  //input[@name="password"]
${rememberme_input}     //*[@id="remember_me"]
${seconnecter}  //*[@class="btn cta-button connect"]
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

${username}     ktamiismail@gmail.com
${pwd}      Ixinafordemo@123


*** Keywords ***
Login
    [Arguments]     ${username}     ${pwd}
    SeleniumLibrary.Open Browser    url=${url_ixina}   browser=chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${accept_cookies_btn}    30s
    SeleniumLibrary.Click Element   ${accept_cookies_btn}
    SeleniumLibrary.Wait Until Element Is Visible    ${close_popup_btn}    30s
    Sleep    2s
    SeleniumLibrary.Click Element   ${close_popup_btn}
    SeleniumLibrary.Click Element    ${mon_espace}
    SeleniumLibrary.Wait Until Page Contains    Bienvenue
    SeleniumLibrary.Wait Until Element Is Visible    ${username_input}    30s
    SeleniumLibrary.Wait Until Element Is Visible    ${password_inpuit}    30s
    SeleniumLibrary.Input Text   ${username_input}      ${username}
    SeleniumLibrary.Input Password   ${password_inpuit}     ${pwd}
    Select Checkbox    ${rememberme_input}
    SeleniumLibrary.Click Element   ${seconnecter}
    SeleniumLibrary.Wait Until Page Contains    Bienvenue Ismail

Im on the login page
    SeleniumLibrary.Open Browser    url=${url_ixina}   browser=chrome
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${accept_cookies_btn}    30s
    SeleniumLibrary.Click Element   ${accept_cookies_btn}
    SeleniumLibrary.Wait Until Element Is Visible    ${close_popup_btn}    30s
    Sleep    2s
    SeleniumLibrary.Click Element   ${close_popup_btn}
    SeleniumLibrary.Click Element    ${mon_espace}
    SeleniumLibrary.Wait Until Page Contains    Bienvenue

I enter a valid username
    SeleniumLibrary.Wait Until Element Is Visible    ${username_input}    30s
    SeleniumLibrary.Input Text   ${username_input}      ${username}

I enter a valid password
    SeleniumLibrary.Wait Until Element Is Visible    ${password_inpuit}    30s
    SeleniumLibrary.Input Password   ${password_inpuit}     ${pwd}


I check remember input
    Select Checkbox    ${rememberme_input}

I press Login
    SeleniumLibrary.Click Element   ${seconnecter}

I should be on the user home page
        ${location}=     Get Location
        Wait Until Keyword Succeeds    3    10s    Should Be Equal    ${location}    https://monespace.ixina.fr/
        
I should see Bienvenu
    SeleniumLibrary.Wait Until Page Contains    Bienvenue