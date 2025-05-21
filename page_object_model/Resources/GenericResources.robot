***Settings***
Documentation    A resource file with resable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${invalid_password}    invalid123
${blank_username}    
${blank_password}    
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser_name}    Chrome


***Keywords***
Open the Browser with URL
    Create webdriver    ${browser_name}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close Browser Session
    Close Browser