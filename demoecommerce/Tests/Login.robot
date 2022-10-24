*** Settings ***
Resource  ../Resources/Functional_Keywords.robot
Resource  ../Resources/Login.robot

*** Test Cases ***
Login into the "Automation Practice" website
    Go to the "Automation Practice" website
    Go to the "Login" page
    Input user and password
    Login into the website
    Return to the home page
    Finish web tests