*** Settings ***
Documentation     To verify the login functionality for Sauce Demo website
Library           SeleniumLibrary
Library           DataDriver    file=C:/pythonselenium/sampleprocess/Resource/New Microsoft Excel Worksheet.xlsx    sheet_name=Sheet1
Test Template     To Validate Successful Login

*** Variables ***
${product_text}    xpath://*[@class="product_label"]

*** Test Cases ***
Login with user ${username}    ${username}    ${password}

*** Keywords ***
To Validate Successful Login
    [Arguments]    ${username}    ${password}    ${expected_status}
    Open The Browser with url
    Fill the Login Credentials    ${username}    ${password}
    Run Keyword If    '${expected_status}' == 'success'    Verify the login successful
    ...    ELSE    Verify locked out error is shown
    Close Browser Session

Open The Browser with url
    Open Browser    https://www.saucedemo.com/v1/index.html    browser=firefox
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

Fill the Login Credentials
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name="user-name"]    ${username}
    Input Password    css:input[id="password"]    ${password}
    Click Element    css:input[type="submit"]

Verify the login successful
    Element Text Should Be    ${product_text}    Products

Verify locked out error is shown
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/h3    Epic sadface: Sorry, this user has been locked out.

Close Browser Session
    Close All Browsers
