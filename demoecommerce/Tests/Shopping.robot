*** Settings ***
Documentation  Validation of the shopping functionality
Resource  ../Resources/Functional_Keywords.robot
Resource  ../Resources/Login.robot

*** Test Cases ***
Add a product to the cart and confirm the order
    Go to the "Automation Practice" website
    Go to the "Login" page
    Input user and password
    Login into the website
    Validate the "Blouses" subcategory
    Validate a "Blouses" product
    Add product to cart
    Proceed to checkout
    Accept therms of use
    Confirm payment option
    Confirm order
    Return to the home page
    Finish web tests