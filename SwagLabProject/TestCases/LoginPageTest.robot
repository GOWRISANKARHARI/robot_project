*** Settings ***
Documentation    To login into the website
Library    SeleniumLibrary
Library    DataDriver    file=C:\\pythonselenium\\SwagLabProject\\utill\\LoginDetails.csv    encoding=utf_8    dialect=unix
Test Setup    Open the url with the browser
Test Teardown    Close Browser Sessions
Resource    C:/pythonselenium/SwagLabProject/Resources/GenericResource.robot
Resource    ../Resources/Login.robot
Resource    ../Resources/DashboardResource.robot
Test Template    Validate the login funcionality

*** Variables ***
${username}    
${password}

*** Test Cases ***
login using csv data
    ${username}    ${password}

*** Keywords ***
Validate the login funcionality 
    [Tags]    validusername
    [Arguments]    ${username}    ${password}
    Login.Login to the website with login credentials    ${username}    ${password}
    IF    '${username}' == 'standard_user' and '${password}' == 'secret_sauce'
        DashboardResource.Verify the logged in or not
    ELSE IF    '${username}' == 'locked_out_user' and '${password}' == 'secret_sauce'
        DashboardResource.Verify the logged in or not
    ELSE IF    '${username}' == 'problem_user' and '${password}' == 'secret_sauce'
        DashboardResource.Verify the logged in or not
    ELSE IF    '${username}' == 'performance_glitch_user' and '${password}' == 'secret_sauce'
        DashboardResource.Verify the logged in or not
    ELSE IF    '${username}' == 'error_user' and '${password}' == 'secret_sauce'
        DashboardResource.Verify the logged in or not
    ELSE IF    '${username}' == 'visual_user' and '${password}' == 'secret_sauce'
        DashboardResource.Verify the logged in or not
    ELSE
        Login.Verify the errortext
    END