*** Settings ***
Force Tags      valid-register
Default Tags    owner-thanh    smoke

Library     SeleniumLibrary
Library     DataDriver  ../Data/UserCredentials.xlsx    sheet_name=Sheet1
Resource    ../Resources/register_resources.robot
Resource    ../Resources/common_resources.robot

Suite Setup     Open My Browser
Suite Teardown  Close Browsers
Test Setup  Open Register Page
Test Template  Valid Registration

*** Test Cases ***
Users Registration should be successful with valid credentials
    using   ${username} and ${password} and ${firstname} and ${lastname} and  ${phone}

*** Keywords ***
Valid Registration
    [Arguments]     ${username}     ${password}     ${firstname}    ${lastname}     ${phone}
    Input Username  ${username}
    Input Password  ${password}
    Input Personal Information  ${firstname}    ${lastname}     ${phone}
    Click Register Button

    sleep  1

    ${currentlocation}=     Get location
    IF  "${currentlocation}" == "http://${SERVER}/register"
        Username already exists  ${username}
    ELSE
        Login Page Should Be Visible
    END

