*** Settings ***
Library  SeleniumLibrary
Library    resources/common/pages/base_page.py
Variables    resources/demoqa/data/demoqa_data.yaml

#Resource    resources/common/pages/base_page.py
#Library    resources/common/pages/base_page.py  WITH NAME  base_page

*** Variables ***
${main_logo}    //*[@id="app"]/header/a
${form name}    //div[contains(text(),'Practice Form')]
${elements_pannel}  //div[@class='left-pannel']

${input_first_name_textbox}  //input[@id='firstName']
${input_last_name_textbox}  //input[@id='lastName']
${input_email_textbox}      //input[@id='userEmail']
${male_radio}               //input[@id='gender-radio-1']
${female_radio}             //input[@id='gender-radio-2']
${other_radio}              //input[@id='gender-radio-3']
${phone_number_textbox}     //input[@id='userNumber']
${birth_date}               //input[@id='dateOfBirthInput']

*** Keywords ***
verify_happy_elements
    Element Should Be Visible    ${main_logo}
    Element Should Be Visible    ${form_name}
    Element Should Be Visible    ${elements_pannel}

#generate_first_name
#    ${gen}=    base_page.Generators
#    ${generated_name}=    Call Method    ${gen}    generate_username    ${test_user.first_name}
#    Log    ${generated_name}
#    Input Text            ${input_first_name_textbox}  ${generated_name}
#
generate_first_name
    Click Element         ${input_first_name_textbox}
    Clear Element Text    ${input_first_name_textbox}
    ${generated_name}=    generate_username  ${test_user.first_name}
    Input Text            ${input_first_name_textbox}  ${generated_name}

#enter_first_name
#    Click Element         ${input_first_name_textbox}
#    Clear Element Text    ${input_first_name_textbox}
#    Input Text            ${input_first_name_textbox}  ${test_user.first_name}

generate_last_name
    Click Element         ${input_last_name_textbox}
    Clear Element Text    ${input_last_name_textbox}
    ${generated_name}=    generate_username    ${test_user.last_name}
    Input Text            ${input_last_name_textbox}  ${generated_name}

#enter_last_name
#    Click Element         ${input_last_name_textbox}
#    Clear Element Text    ${input_last_name_textbox}
#    Input Text            ${input_last_name_textbox}  ${test_user.last_name}

enter_email
    Click Element         ${input_email_textbox}
    Clear Element Text    ${input_email_textbox}
    Input Text            ${input_email_textbox}  ${test_user.email}

check_sex_radio
    Radio Button Should Not Be Selected    gender
    Select Radio Button    gender  ${test_user.sex}

generate_phone_number
    Click Element    ${phone_number_textbox}
    Clear Element Text    ${phone_number_textbox}
    ${generated_phone}=     Generate_phone
    Input Text    ${phone_number_textbox}  ${generated_phone}

#enter_phone
#    Click Element    ${phone_number}
#    Clear Element Text    ${phone_number}
#    Input Text    ${phone_number}  ${test_user.phone}

enter_dob
#    Click Element   ${birth_date}
    Clear Element Text  ${birth_date}
#    Press Keys    ${birth_date}  CTRL+a   BACKSPACE
#    Press Keys    ${birth_date}  BACKSPASE
    Input Text    ${birth_date}     ${test_user.DOB}
    Press Keys    ${birth_date}     RETURN
