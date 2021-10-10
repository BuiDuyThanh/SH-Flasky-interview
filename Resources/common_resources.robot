*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SERVER}               127.0.0.1:5000
${BASE URL}             http://${SERVER}
${LOGIN URL}            http://${SERVER}/login
${USER URL}             http://${SERVER}/user
${ERROR URL}            http://${SERVER}/error
${REGISTER URL}         http://${SERVER}/register
${BROWSER}              chrome

*** Keywords ***
Open My Browser
    open browser    ${BASE URL}        ${BROWSER}
    maximize browser window
    sleep  1

Close Browsers
    close all browsers

Input Username
    [Arguments]     ${username}
    input text      id:username     ${username}

Input Password
    [Arguments]     ${password}
    input text      id:password     ${password}

Input Personal Information
    [Arguments]     ${firstname}    ${lastname}     ${phone}
    input text      id:firstname    ${firstname}
    input text      id:lastname     ${lastname}
    input text      id:phone        ${phone}
