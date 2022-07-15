*** Setting ***
Documentation     Register feature test case
Suite Setup       Set Selenium Implicit Wait    ${maximum_wait_time}
Suite Teardown    Close all browsers
Test Setup        Open Tops website
Test Teardown     Close Browser
Force Tags        Register
Default Tags      Non-Critical
Test Timeout      30 seconds
Resource          ../Resources/locators.resource
Resource          ../Resources/testdata.resource
Resource          ../Keywords/Register/Register_Keywords.robot
Library           SeleniumLibrary
Library           BuiltIn
Library           String

*** Test Cases ***
Verify that register page display email, password and confirm password fields
    [Documentation]    Non-critical test case
    [Tags]    Register_by_Email
    Given TOPS website is open
    When Register Tops member
    Then Verify register page

Verify that error message shown when user fill in incorrect email format
    [Documentation]    Critical test case
    [Tags]    Register_by_Email    Critical
    Given TOPS website is open
    When Register Tops member
    And Fill register data
    Then Verify register error message of email

Verify that the next button is disabled when user do not fill in any information
    [Documentation]    Non-critical test case
    [Tags]    Register_by_Email
    Given TOPS website is open
    When Register Tops member
    Then Verify register by email disable button

Verify that after register success app will display success page
    [Documentation]    Non-critical test case
    [Tags]    Register_success_page
    Given TOPS website is open
    When Register Tops member success
    Then Verify register EN success message

Verify that Success page support both EN and TH
    [Documentation]    Non-critical test case
    [Tags]    Register_success_page
    Given TOPS website is open
    When Register Tops member success
    Then Verify register EN success message
    When Change language EN to TH in the register success page
    Then Verify register TH success message

Verify that when customer click OK button system should redirect to homepage
    [Documentation]    Non-critical test case
    [Tags]    Register_success_page
    Given TOPS website is open
    When Register Tops member success
    Then Verify register success
