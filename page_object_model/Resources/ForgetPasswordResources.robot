*** Settings ***
Documentation    Forgot password page resource for the website
Library    SeleniumLibrary

*** Variables ***

${forgot_password_username}    css:.orangehrm-forgot-password-title
${username}    css:.oxd-input--active
${reset_button}   css:.orangehrm-forgot-password-button--reset
${cancel_button}    css:.orangehrm-forgot-password-button--cancel
${reset_message}    xpath://div[@class='orangehrm-card-container']/h6
${login_page_title}    xpath://*[@class='orangehrm-login-slot']/h5

*** Keywords ***
Verify Forgot Your Password page Opens
    Element Text Should Be    ${forgot_password_username}    Reset Password

Fill the Forgot Password Page
    Input Text    ${username}    abc@gmail.com
    Click Button    ${reset_button}

Verify the message
    Element Text Should Be    ${reset_message}    Reset Password link sent successfully

Cancel the Reset Password
    Click Button    ${cancel_button}

Verify that Login Page is displayed
    Element Text Should Be    ${login_page_title}    Login