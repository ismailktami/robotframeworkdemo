*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  gc
${WEBSITE}  http://automationpractice.com/index.php

*** Keywords ***
#Sections_and_products_validation - Keywords

Go to the "Automation Practice" website
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  ${WEBSITE}
    Sleep  2s
    
Return to the home page
    Go To  ${WEBSITE}
    
Finish web tests
    Close Browser

Validate the "Women" section
    Click Element  class=sf-with-ul
    Page Should Contain  Women
    Sleep  2s

Validate the "Tops" category
    Mouse Over  class=sf-with-ul
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/a
    Page Should Contain  Tops
    Sleep  2s

Validate the "T-shirts" subcategory
    Click Element  xpath://*[@id="subcategories"]/ul/li[1]/div[1]/a/img
    Page Should Contain  T-shirts
    Sleep  2s
    
Validate a "T-shirt" product
    Click Element    xpath://*[@id="center_column"]/ul/li/div/div[2]/h5/a
    Page Should Contain  Faded Short Sleeve T-shirts
    Sleep  2s
    
Validate the "Blouses" subcategory
    Mouse Over    class=sf-with-ul
    Click Element    xpath://*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[2]/a
    Page Should Contain  Blouses
    Sleep  2s
    
Validate a "Blouses" product
    Click Element  xpath://*[@id="center_column"]/ul/li/div/div[2]/h5/a
    Page Should Contain  Blouse
    Sleep  2s

Validate the "Dresses" section
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[2]/a
    Page Should Contain  Dresses
    Sleep  2s

Validate the "Casual Dresses" subcategory
    Click Element  xpath://*[@id="subcategories"]/ul/li[1]/div[1]/a/img
    Page Should Contain  Casual Dresses
    Sleep  2s

Validate a "Casual Dress" product
    Click Element  xpath://*[@id="center_column"]/ul/li/div/div[2]/h5/a
    Page Should Contain  Printed Dress
    Sleep  2s

Validate the "Evening Dresses" subcategory
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[2]/a
    Click Element  xpath://*[@id="subcategories"]/ul/li[2]/div[1]/a/img
    Page Should Contain  Evening Dresses
    Sleep  2s

Validate a "Evening Dress" product
    Click Element  xpath://*[@id="center_column"]/ul/li/div/div[2]/h5/a
    Page Should Contain  Printed Dress
    Sleep  2s

Validate the "Summer Dresses" subcategory
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[2]/a
    Click Element  xpath://*[@id="subcategories"]/ul/li[3]/div[1]/a/img
    Page Should Contain  Summer Dresses
    Sleep  2s

Validate a "Summer Dress" product
    Click Element  xpath://*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a
    Page Should Contain  Printed Summer Dress
    Sleep  2s

#Search_bar_test - Keywords

Search "T shirt" products
    Go to the "Automation Practice" website
    Click Element  id=search_query_top
    Input Text  id=search_query_top  t shirt
    Press Keys  name=submit_search  [RETURN]
    Page Should Contain Image  http://automationpractice.com/img/p/1/1-home_default.jpg
    Sleep  2s

Search "Blouses" products
    Click Element  id=search_query_top
    Clear Element Text  id=search_query_top
    Input Text  id=search_query_top  blouses
    Press Keys  name=submit_search  [RETURN]
    Page Should Contain Image  http://automationpractice.com/img/p/7/7-home_default.jpg
    Sleep  2s

Search "Dresses" section
    Click Element  id=search_query_top
    Clear Element Text  id=search_query_top
    Input Text  id=search_query_top  dresses
    Press Keys  name=submit_search  [RETURN]
    Page Should Contain  7 results have been found
    Sleep  2s

Search a "Casual Dress" product
    Click Element  id=search_query_top
    Clear Element Text  id=search_query_top
    Input Text  id=search_query_top  casual dress
    Press Keys  name=submit_search  [RETURN]
    Page Should Contain  4 results have been found
    Sleep  2s

Search a "Evening Dress" product
    Click Element  id=search_query_top
    Clear Element Text  id=search_query_top
    Input Text  id=search_query_top  evening dress
    Press Keys  name=submit_search  [RETURN]
    Page Should Contain  1 result has been found
    Sleep  2s

Search a "Summer Dress" product
    Click Element  id=search_query_top
    Clear Element Text  id=search_query_top
    Input Text  id=search_query_top  summer dress
    Press Keys  name=submit_search  [RETURN]
    Page Should Contain  4 results have been found
    Sleep  2s

#Shopping - Keywords
Add product to cart
    Click Element  xpath://*[@id="add_to_cart"]/button/span
    Sleep  2s
    Click Element  xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
    Page Should Contain  Your shopping cart

Proceed to checkout
    Click Element  xpath://*[@id="center_column"]/p[2]/a[1]/span
    Click Element  xpath://*[@id="center_column"]/form/p/button/span

Accept therms of use
    Click Element  xpath://*[@id="cgv"]
    Click Element  xpath://*[@id="form"]/p/button/span

Confirm payment option
    Click Element  class=bankwire

Confirm order
    Click Element  xpath://*[@id="cart_navigation"]/button/span
    Page Should Contain  Your order on My Store is complete
    Sleep  2s