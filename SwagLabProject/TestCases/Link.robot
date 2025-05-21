*** Settings ***
Documentation    To getting all the links
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Resource    C:/pythonselenium/SwagLabProject/Resources/GenericResource.robot
Resource    ../Resources/Login.robot
Resource    ../Resources/DashboardResource.robot
Test Template    Validate the Links

*** Test Cases ***
login using csv data
    standard_user    secret_sauce

*** Keywords ***
Validate the links
    [Arguments]    ${username}    ${password}
    GenericResource.Open the url with the browser
    Login.Login to the website with login credentials    ${username}    ${password}
    DashboardResource.Verify the logged in or not
    DashboardResource.Get all the link
    DashboardResource.Check whether there is any broken link or not
    GenericResource.Close Browser Sessions
