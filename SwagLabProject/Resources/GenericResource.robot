*** Settings ***
Documentation    This resource file is for resuable keywords and variables
Library    SeleniumLibrary
Resource    ../Resources/Login.robot
*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Firefox
${common_user}    standard_user
${common_Password}    secret_sauce

*** Keywords ***

Open the url with the browser
    Create Webdriver    ${browser}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

Login with login credentials
    Login.Login to the website with login credentials    ${common_user}    ${common_Password}

    
Close Browser Sessions
    Close All Browsers