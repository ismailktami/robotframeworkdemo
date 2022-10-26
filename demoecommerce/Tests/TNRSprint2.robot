*** Settings ***
Documentation  Search bar test validation
Resource  ../Resources/Functional_Keywords.robot
Force Tags    TESTPLAN-30    SUITE-42  SPRINT2
Test Teardown  Run Keyword If Test Failed    Capture Page Screenshot    ${Test Tags}[0]_TEST_FAILED.png 

*** Test Cases ***
Search products of the "Tops" category
    [Tags]  ID-41
    Search "T shirt" products
    Search "Blouses" products

Search differet "Dresses" products
    [Tags]  ID-43
    Search "Dresses" section
    Search a "Casual Dress" product
    Search a "Evening Dress" product
    Search a "Summer Dress" product
    Finish web tests