*** Settings ***
Force Tags      ui-test
Default Tags    owner-thanh    smoke

Library  SeleniumLibrary
Resource    ../Resources/common_resources.robot

Suite Setup     Open My Browser
Suite Teardown  Close Browsers

*** Test Cases ***
UITest
    [Tags]      front-page      login-page
    FrontPage
    sleep   1
    LoginPage
    sleep   1

*** Keywords ***
FrontPage
    title should be             index page - Demo App
    capture page screenshot     ../Output/Screenshots/01__HomePage_FrontPage.png

LoginPage
    click link                  xpath://a[contains(text(),'Log In')]
    Element Text Should Be      //header//h1                                Log In
    ${"username_txt"}           set variable                                id:username
    ${"password_txt"}           set variable                                id:password
    element should be visible   ${"username_txt"}
    element should be enabled   ${"username_txt"}
    input text                  ${"username_txt"}                           user1

    element should be visible   ${"password_txt"}
    element should be enabled   ${"password_txt"}
    input text                  ${"password_txt"}                           123456789

    sleep   1
    clear element text          ${"username_txt"}
    clear element text          ${"password_txt"}
    sleep  1
    capture page screenshot     ../Output/Screenshots/01__HomePage_LoginPage.png
