*** Settings ***
Documentation    This resources contains dashboard elements
Library    SeleniumLibrary
Library    Collections
Library    RequestsLibrary


*** Variables ***
${Title_text}    xpath://*[@class="app_logo"]

*** Keywords ***
Verify the logged in or not
    Element Text Should Be    ${Title_text}    Swag Labs
Get all the link
    @{elements}=    Get WebElements    //a
    ${all_links}=    Create List
    FOR    ${el}    IN    @{elements}
        ${href}=    Get Element Attribute    ${el}    href
        Run Keyword If    '${href}' != 'None' and '${href}' != ''    Append To List    ${all_links}    ${href}
    END
    Set Suite Variable    @{all_links}    ${all_links}
    ${length}=    Get Length    ${all_links}
    Log    Total links found: ${length}

Check whether there is any broken link or not
    ${base_url}=    Get Location
    @{all_links}=    Get all the link

    FOR    ${link}    IN    @{all_links}
        Log    Checking link: ${link}
        Go To    ${base_url}
        Wait Until Page Contains Element    //a[@href="${link}"]
        Click Element    //a[@href="${link}"]
        ${current_url}=    Get Location
        Should Not Contain    ${current_url}    error    msg=Broken link found: ${link}
        Go Back
    END