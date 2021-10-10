*** Settings ***
Force Tags      valid-login
Default Tags    owner-thanh    smoke

Library     SeleniumLibrary
Library     DataDriver  ../Data/UserCredentials.xlsx    sheet_name=Sheet1
Resource    ../Resources/login_resources.robot
Resource    ../Resources/common_resources.robot

Suite Setup     Open My Browser
Suite Teardown  Close Browsers
Test Setup  Open Login Page
Test Template  Valid Login

*** Test Cases ***
Users should login successfully with Valid Credentials
    using   ${username}     and     ${password}

*** Keywords ***
Valid Login
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password  ${password}
    Click Login Button
    User Page Should Be Visible
    Click Log Out Link
