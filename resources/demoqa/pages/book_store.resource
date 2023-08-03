*** Settings ***
Library  SeleniumLibrary
Library    resources/common/pages/base_page.py
Library    resources/demoqa/pages/demoqa.py
Variables    resources/demoqa/data/demoqa_data.yaml

*** Variables ***
${global_username}      Generate Username               ${test_user.first_name}
${global_password}      generate_password

${login_sign}           //h5[contains(text(),'Login in Book Store')]
${label_username}       //label[@id='userName-label']
${label_password}       //label[@id='password-label']

${btn_new_user}         //button[@id='newUser']
${btn_login}            //button[@id='login']

${textbox_username}     //*[@id='userName']
${textbox_password}     //*[@id='password']

${invalid_cred}         //p[@id='name']

${form_registration}    //h4[contains(text(),'Register to Book Store')]
${frame_new_user_captcha}   //iframe[@title='reCAPTCHA']
${new_user_captcha}     //*[@id='rc-anchor-container']
${textbox_first_name}   //input[@id='firstname']
${textbox_last_name}   //input[@id='firstname']

*** Keywords ***
check_happy_elements_login
    Element Should Be Visible       ${login_sign}
    Element Should Be Visible       ${label_username}
    Element Should Be Visible       ${label_password}
    Element Should Be Visible       ${btn_new_user}
    Element Should Not Be Visible   ${invalid_cred}

check_happy_elements_new_user
    Element Should Be Visible

enter_initial_generated_credentials
    ${username}=                    Generate Username               ${test_user.first_name}
    Clear Element Text              ${textbox_username}
    Input Text                      ${textbox_username}             ${username}
    ${password}=                    Generate Password
    Clear Element Text              ${textbox_password}
    Input Text                      ${textbox_password}             ${password}

check_invalid_login
    Enter_initial_generated_credentials
    Click Button                    ${btn_login}
    Wait Until Element Is Visible   ${invalid_cred}
    Element Text Should Be          ${invalid_cred}                 Invalid username or password!

create_new_user
    Enter_initial_generated_credentials
    Click Button                    ${btn_new_user}
    Wait Until Element Is Visible   ${form_registration}
#    Select Frame                    ${frame_new_user_captcha}
#    Element Should Be Visible       ${new_user_captcha}
#    Unselect Frame                  ${frame_new_user_captcha}
    Clear Element Text              ${textbox_first_name}
    Input Text                      ${textbox_first_name}           ${test_user.first_name}
    Clear Element Text              ${textbox_last_name}
    Input Text                      ${textbox_last_name}            ${test_user.last_name}
    Clear Element Text              ${textbox_username}
    Input Text                      ${textbox_username}             ${global_username}
    Clear Element Text              ${textbox_password}
    Input Text                      ${textbox_password}             ${global_password}
    Sleep    10