*** Settings ***
Resource  ../Resources/Functional_Keywords.robot
Resource  ../Resources/Login.robot
Force Tags    TESTPLAN-30    SUITE-32  SPRINT1

*** Test Cases ***
Login with valid username and pwd
    [Tags]      ID-29
    Go to the "Automation Practice" website
    Go to the "Login" page
    Input user and password
    Login into the website
    Return to the home page
    Finish web tests

Login with invalid username
    [Tags]      ID-33
    Go to the "Automation Practice" website
    Go to the "Login" page
    Input user and password
    Login into the website
    Return to the home page
    Finish web tests

Login with invalid pwd
    [Tags]      ID-34
    Go to the "Automation Practice" website
    Go to the "Login" page
    Input user and password
    Login into the website
    Return to the home page
    Finish web tests