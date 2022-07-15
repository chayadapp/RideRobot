*** Keywords ***
Open Tops website
    Open Browser    ${tops_uat_url}    chrome
    Maximize Browser Window

Log in as Tops member
    Click Element    ${login_btn}
    Wait Until Element Is Visible    ${email}
    Input Text    ${email}    ${email_login_info}
    Input Text    ${password}    ${password_login_info}
    Click Element    ${submit_login_btn}

Register Tops member
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}

Verify register page
    Wait Until Element Is Visible    ${register_already_account_txt}
    ${already_account_txt}    Get Text    ${register_already_account_txt}
    Log to console    ${already_account_txt}
    Should Be Equal    ${already_account_txt}    ${expected_already_account_txt}

Fill register data
    Wait Until Element Is Visible    ${register_enter_email}
    Input Text    ${register_enter_email}    ${incorrect_email_info}
    Input Text    ${register_enter_password}    ${password_login_info}
    Input Text    ${register_enter_confirm_password}    ${password_login_info}
    Click Element    ${register_by_email_btn}

Verify register error message of email
    Wait Until Element Is Visible    ${register_email_error}
    ${actual_register_email_error}    Get Text    ${register_email_error}
    Log to console    ${actual_register_email_error}
    Should Be Equal    ${actual_register_email_error}    ${expected_register_email_error}

Generate email info
    ${random_string}    Generate Random String    4    [NUMBERS]
    ${random_email}    Set Variable    nuk6395+${random_string}@gmail.com
    Set Test Variable    ${random_email}

Register Tops member success
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    ${register_enter_email}
    Generate email info
    Input Text    ${register_enter_email}    ${random_email}
    Input Text    ${register_enter_password}    ${password_login_info}
    Input Text    ${register_enter_confirm_password}    ${password_login_info}
    Wait Until Element Is Enabled    ${register_by_email_btn}
    Click Element    ${register_by_email_btn}
    Wait Until Element Is Visible    ${register_success_ok_btn}

Verify register success
    Wait Until Element Is Visible    ${register_success_ok_btn}
    SeleniumLibrary.Click Element    ${register_success_ok_btn}
    Wait Until Element Is Visible    ${verify_register_btn}

Verify register EN success message
    Wait Until Element Is Visible    ${register_success_txt}
    ${register_success_actual_EN_txt}    Get Text    ${register_success_txt}
    ${register_success_actual_EN_txt}    Replace String    ${register_success_actual_EN_txt}    \n    ${EMPTY}
    Log to console    ${register_success_actual_EN_txt}
    Should Be Equal    ${register_success_actual_EN_txt}    ${register_success_expected_EN_txt}

Verify register by email disable button
    Wait Until Element Is Visible    ${register_by_email_btn}
    Click Element    ${register_by_email_btn}
    element should be disabled    ${register_by_email_btn}

Change language EN to TH in the register success page
    Wait Until Element Is Visible    ${TH_version_btn}
    Sleep    5s
    Click Element    ${TH_version_btn}
    ${text}    Get Text    ${register_success_txt}
    Log to console    After change th TH ${text}

Change language TH to EN in the register success page
    Wait Until Element Is Visible    ${EN_version_css_btn}
    Click Element    ${EN_version_css_btn}

TOPS website is open
    Wait Until Element Is Visible    ${tops_logo}

Verify register TH success message
    Wait Until Element Is Visible    ${register_success_txt}
    ${register_success_actual_TH_txt}    Get Text    ${register_success_txt}
    ${register_success_actual_TH_txt}    Replace String    ${register_success_actual_TH_txt}    \n    ${EMPTY}
    Log to console    ${register_success_actual_TH_txt}
    Should Be Equal    ${register_success_actual_TH_txt}    ${register_success_expected_TH_txt}
