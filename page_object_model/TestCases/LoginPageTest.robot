*** Settings ***
Documentation    Test cases for the login page
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown   Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DashboardResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ForgetPasswordResources.robot

*** Test Cases ***
Validate Unsuccessful Login using invalid credentials
    [Tags]    invalid
    LoginResources.Fill the login form    ${valid_username}    ${invalid_password}
    LoginResources.Verify the error message is correct

Validate Unsuccessful Login for blank username
    [Tags]    blank username
    LoginResources.Fill the login form    ${blank_username}    ${valid_password}
    LoginResources.Verify the error message is displayed for username

Validate Unsuccessful Login for blank password
    [Tags]    blank password
    LoginResources.Fill the login form    ${valid_username}    ${blank_password}
    LoginResources.Verify the error message is displayed for password

Validate successful Login
    [Tags]    valid
    LoginResources.Fill the login form    ${valid_username}    ${valid_password}
    DashboardResources.Verify Dashboard page opens