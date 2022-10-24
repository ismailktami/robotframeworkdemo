*** Settings ***
Library     SeleniumLibrary
Library    Browser

*** Keywords ***

Click element for ixina
    [Arguments]     ${xpath}    ${check_visibility}=${False}    ${scroll_to_element}=${True}
    Run Keyword If    ${check_visibility}
    ...    Wait Until Element Is Visible    ${xpath}    30s
    Run Keyword If    ${scroll_to_element}
    ...    Scroll Element Into View    ${xpath}
    Click Element    ${xpath}

Click link for ixina
    [Arguments]     ${xpath}
    Click Link    ${xpath}
