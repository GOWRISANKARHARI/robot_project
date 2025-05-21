*** Settings ***
Documentation    Checkout the product 
Library    SeleniumLibrary
Resource    C:/pythonselenium/SwagLabProject/Resources/GenericResource.robot
Resource    ../Resources/Login.robot
Resource    ../Resources/DashboardResource.robot
Resource    ../Resources/orderResource.robot
Test Template    Validate the Links

*** Test Cases ***
login using csv data
    standard_user    secret_sauce

*** Keywords ***
Validate the links
    [Arguments]    ${username}    ${password}
    GenericResource.Open the url with the browser
    Login.Login to the website with login credentials    ${username}    ${password}
    orderResource.Checkout the product
    GenericResource.Close Browser Sessions
