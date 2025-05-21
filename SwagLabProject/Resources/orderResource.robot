*** Settings ***
Documentation    This resources contains dashboard elements
Library    SeleniumLibrary

*** Variables ***
${product1}    xpath:(//*[@class="btn btn_primary btn_small btn_inventory "])[1]
${your_cart}    xpath://*[@class="shopping_cart_link"]
${checkout}    xpath://*[@id="checkout"]
${first_name}    xpath:(//*[@class="input_error form_input"])[1]
${last_name}    xpath:(//*[@class="input_error form_input"])[2]
${zip}    xpath:(//*[@class="input_error form_input"])[3]
${continue}    xpath://*[@class="submit-button btn btn_primary cart_button btn_action"]
${finish}    xpath://*[@class="btn btn_action btn_medium cart_button"]
${verification}    xpath://*[@class="complete-header"]

*** Keywords ***
Checkout the product
    Click Element    ${product1}
    Click Element    ${your_cart}
    Sleep    2s  
    Click Button    ${checkout}
    Input Text    ${first_name}    hari
    Input Text    ${last_name}    s
    Input Text    ${zip}    635236
    Click Element    ${continue}
    Click Element    ${finish}
    Element Text Should Be    ${verification}    Thank you for your order!