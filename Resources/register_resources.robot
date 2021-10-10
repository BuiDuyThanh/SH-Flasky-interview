*** Settings ***
Library     SeleniumLibrary
Resource    common_resources.robot
Library     SeleniumLibrary
Resource    common_resources.robot

*** Keywords ***
Open Register Page
    click link   xpath://a[contains(text(),'Register')]

Click Register Button
    click element   xpath://body/section[1]/form[1]/input[6]

Username already exists
    [Arguments]  ${username}
    Page should contain     User ${username} is already registered.
    Log     User ${username} is already registered.

Login Page Should Be Visible
    location should be      ${LOGIN URL}
    title should be         Log In - Demo App