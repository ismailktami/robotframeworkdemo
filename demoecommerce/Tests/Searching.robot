*** Settings ***
Documentation  Search bar test validation
Resource  ../Resources/Functional_Keywords.robot

*** Test Cases ***
Search products of the "Tops" category
    Search "T shirt" products
    Search "Blouses" products

Search differet "Dresses" products
    Search "Dresses" section
    Search a "Casual Dress" product
    Search a "Evening Dress" product
    Search a "Summer Dress" product
    Finish web tests