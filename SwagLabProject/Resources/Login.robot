*** Settings ***
Documentation    To have the Login Page elements
Library    SeleniumLibrary

*** Variables ***
${username_field}    css:input[id='user-name']
${password_field}    css:input[id='password']
${login_btn}    css:input[id='login-button']
${error_text}    xpath://*[@class="error-message-container error"]


*** Keywords ***
Login to the website with login credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}
    Click Element    ${login_btn}

Verify the errortext
    Element Should Be Visible    ${error_text}