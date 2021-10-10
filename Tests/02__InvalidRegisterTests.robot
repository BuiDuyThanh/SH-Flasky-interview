*** Settings ***
Force Tags      invalid-register
Default Tags    owner-thanh    smoke

Library     SeleniumLibrary
Resource    ../Resources/register_resources.robot
Resource    ../Resources/common_resources.robot
Suite Setup     Run Keywords
...             Open My Browser     AND
...             Open Register Page
Suite Teardown  Close Browsers
Test Template  Invalid Register

*** Test Cases ***      USERNAME        PASSWORD        FIRSTNAME       LASTNAME        PHONE
Empty Username          ${EMPTY}        123456789       Alex            Nguyen          0461273560
Empty Password          user1           ${EMPTY}        Jacob           Gates           0457440359
Empty First Name        user2           123456789       ${EMPTY}        Tyler           0466764890
Empty Last Name         user3           123456789       Phil            ${EMPTY}        0461214359
Empty Phone Number      user4           123456789       John            Lee             ${EMPTY}


*** Keywords ***
Invalid Register
    [Arguments]     ${username}    ${password}     ${firstname}    ${lastname}     ${phone}
    Input Username  ${username}
    Input Password  ${password}
    Input Personal Information  ${firstname}    ${lastname}     ${phone}
    Click Register Button
    Location should be  ${REGISTER URL}
