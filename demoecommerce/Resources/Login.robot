*** Settings ***
Library  SeleniumLibrary
Resource  ./Functional_Keywords.robot

*** Variables ***
${USER}  ktamiismail@gmail.com
${PASSWORD}  robotdemo

*** Keywords ***
Go to the "Login" page
    Click Element  class=login
    Page Should Contain  Authentication
    Sleep  2s

Input user and password
    Click Element  id=email
    Input Text  id=email  ${USER}
    Click Element  id=passwd
    Input Text  id=passwd  ${PASSWORD}

Login into the website
    Press Keys  xpath://*[@id="SubmitLogin"]/span  [RETURN]
    Page Should Contain  Welcome to your account
    Sleep  2s
    Return to the home page
    Sleep  2s