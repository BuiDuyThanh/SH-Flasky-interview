*** Settings ***
Force Tags      invalid-login
Default Tags    owner-thanh    smoke

Library     SeleniumLibrary
Resource    ../Resources/login_resources.robot
Resource    ../Resources/common_resources.robot
Suite Setup     Open My Browser
Suite Teardown  Close Browsers
Test Setup      Open Login Page
Test Template   Invalid Login

*** Test Cases ***                  USERNAME            PASSWORD
Right Username Wrong Password       user1               xyz
Right Username Empty Password       user1               ${EMPTY}

Wrong Username Right Password       luser1              123456789
Wrong Username Wrong Password       luser1              xyz
Wrong Username Empty Password       luser1              ${EMPTY}

Empty Username Right Password       ${EMPTY}            123456789
Empty Username Wrong Password       ${EMPTY}            xyz
Empty Username Empty Password       ${EMPTY}            ${EMPTY}

*** Keywords ***
Invalid Login
    [Arguments]  ${username}    ${password}
    Input Username      ${username}
    Input Password      ${password}
    Click Login Button
    sleep   2
    IF  ("${username}" != "${EMPTY}") and ("${password}" != "${EMPTY}")
        Error Page Should Be Visible
    ELSE
        Location should be      ${LOGIN URL}
    END
