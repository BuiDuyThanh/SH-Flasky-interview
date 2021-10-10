*** Settings ***
Library     SeleniumLibrary
Resource    common_resources.robot

*** Keywords ***

Open Login Page
    click link      xpath://a[contains(text(),'Log In')]

Click Login Button
    click element   xpath://body/section[1]/form[1]/input[3]

Click Log Out Link
    click link      Log Out

Error Page Should Be Visible
    location should be      ${ERROR URL}
    title should be         Login Failure - Demo App
    page should contain     You provided incorrect login details

User Page Should Be Visible
    location should be      ${USER URL}
    page should contain     User Information