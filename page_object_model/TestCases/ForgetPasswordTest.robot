*** Settings ***
Documentation    Test cases for the Fogot your password
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown   Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DashboardResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ForgetPasswordResources.robot

*** Test Cases ***
Validate Reset Password Functionality
    LoginResources.Go to Forgot Your Password Page
    ForgetPasswordResources.Verify Forgot Your Password page Opens
    ForgetPasswordResources.Fill the Forgot Password Page
    ForgetPasswordResources.Verify the message

Validate Cancel Functionality
    LoginResources.Go to Forgot Your Password Page
    ForgetPasswordResources.Verify Forgot Your Password page Opens
    ForgetPasswordResources.Cancel the Reset Button
    ForgetPasswordResources.Verify that Login Page is displayed
