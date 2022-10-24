*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Resource    ../demo-ixina/pages/HomePage.robot
Resource    ../demo-ixina/pages/LoginPage.robot
Resource    ../demo-ixina/pages/AppointmentPage.robot
Resource    ../demo-ixina/pages/SimulationPage.robot

Suite Setup
Suite Teardown
Test Teardown
*** Test Cases ***

Login
    [Tags]  Login   Gherkin
    Given Im on the login page
    When I enter a valid username
    And I enter a valid password
    And I check remember input
    And I press Login
    Then I should be on the user home page
    And I should see Bienvenu

# PrendreRendezvousProjet
#     [Tags]  TXRAY-1144
#     SeleniumLibrary.Open Browser    url=${url_ixina}   browser=chrome
#     SeleniumLibrary.Maximize Browser Window
#     SeleniumLibrary.Wait Until Element Is Visible    ${accept_cookies_btn}    30s
#     SeleniumLibrary.Click Element   ${accept_cookies_btn}
#     SeleniumLibrary.Wait Until Element Is Visible    ${close_popup_btn}    30s
#     Sleep    2s
#     SeleniumLibrary.Click Element   ${close_popup_btn}
#     SeleniumLibrary.Click Element    ${mon_espace}
#     SeleniumLibrary.Wait Until Page Contains    Bienvenue
#     SeleniumLibrary.Wait Until Element Is Visible    ${username_input}    30s
#     SeleniumLibrary.Wait Until Element Is Visible    ${password_inpuit}    30s
#     SeleniumLibrary.Input Text   ${username_input}    ktamiismail@gmail.com
#     SeleniumLibrary.Input Password   ${password_inpuit}    Ixinafordemo@123
#     Select Checkbox    ${rememberme_input}
#     SeleniumLibrary.Click Element   ${seconnecter}
#     SeleniumLibrary.Wait Until Page Contains    Bienvenue Ismail
#     SeleniumLibrary.Wait Until Element Is Visible  ${new_appointment}   30s
#     SeleniumLibrary.Click Element    ${new_appointment}
#     SeleniumLibrary.Wait Until Element Is Visible   ${select_arrow}     30s
#     SeleniumLibrary.Click Element    ${select_arrow}
#     SeleniumLibrary.Wait Until Element Is Visible   ${select_paris15}     30s
#     SeleniumLibrary.Click Element    ${select_paris15}
#     SeleniumLibrary.Click Element   ${prendre_rendezvous_btn}
#     Wait Until Page Contains    ${step_descr_rendezvous}    60s
#     SeleniumLibrary.Click Element    ${rendezvous_adistance}
#     SeleniumLibrary.Wait Until Element Is Visible   ${rendezvous_adistance_active}     60s
#     Input Text    ${phone_rendezvous}    0644778855
#     Click Element    ${etape_suivante_btn}

# ChercherParMotCle
#     [Tags]  TXRAY-1122  ch
#     FAIL    FD
#     SeleniumLibrary.Open Browser    url=${url_ixina}   browser=chrome
#     SeleniumLibrary.Maximize Browser Window
#     SeleniumLibrary.Wait Until Element Is Visible    ${accept_cookies_btn}    30s
#     SeleniumLibrary.Click Element   ${accept_cookies_btn}
#     SeleniumLibrary.Wait Until Element Is Visible    ${close_popup_btn}    30s
#     Sleep    2s
#     SeleniumLibrary.Click Element   ${close_popup_btn}
#     SeleniumLibrary.Click Element    ${main_content}
#     SeleniumLibrary.Wait Until Element Is Visible    ${go_to_searchpage}    30s
#     SeleniumLibrary.Click Link    ${go_to_searchpage}
#     SeleniumLibrary.Wait Until Element Is Visible    ${input_search}    30s
#     SeleniumLibrary.Input Text   ${input_search}    table
#     SeleniumLibrary.Click Element    ${search_btn}
#     SeleniumLibrary.Wait Until Page Contains    Résultats de recherche pour
#     SeleniumLibrary.Element Text Should Be    ${result_count}   110 résultats
#     SeleniumLibrary.Scroll Element Into View    ${load_more_btn}
#     SeleniumLibrary.Click Element    ${load_more_btn}
#     Close All Browsers

# SimulationCuisine
#     [Tags]  test
#     Login    ${username}    ${pwd}
#     CreateSimulation
#     SimulationEtape1
#     EtapeSuivante
#     SimulationEtape2
#     EtapeSuivante
#     SimulationEtape3
#     EtapeSuivante
#     SimulationEtape4
#     EtapeSuivante
#     SimulationEtape5
#     Go to step  6   Prendre rendez-vous
#     SeleniumLibrary.Click Element    ${rendezvous_adistance}
#     SeleniumLibrary.Wait Until Element Is Visible   ${rendezvous_adistance_active}     60s
#     Sleep    3s
#     Scroll Element Into View    ${phone_rendezvous}
#     Click element for ixina    //div[@data-to_timestamp="2022-10-28T19:00:00"]
#     Input Text    ${phone_rendezvous}    0644778855
#     Click Element    ${etape_suivante_btn}

