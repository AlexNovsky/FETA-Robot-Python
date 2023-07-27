*** Settings ***
Library  SeleniumLibrary
Library    resources/common/pages/base_page.py
Variables    resources/demoqa/data/demoqa_data.yaml

*** Variables ***
${main_logo}                    //*[@id="app"]/header/a
${form name}                    //div[contains(text(),'Practice Form')]
${elements_pannel}              //div[@class='left-pannel']

${input_first_name_textbox}     //input[@id='firstName']
${input_last_name_textbox}      //input[@id='lastName']
${input_email_textbox}          //input[@id='userEmail']
${phone_number_textbox}         //input[@id='userNumber']
${birth_date}                   //input[@id='dateOfBirthInput']

*** Keywords ***
verify_happy_elements
    Element Should Be Visible   ${main_logo}
    Element Should Be Visible   ${form_name}
    Element Should Be Visible   ${elements_pannel}

generate_first_name
    Click Element               ${input_first_name_textbox}
    Clear Element Text          ${input_first_name_textbox}
    ${generated_name}=          generate_username  ${test_user.first_name}
    Input Text                  ${input_first_name_textbox}  ${generated_name}

generate_last_name
    Click Element               ${input_last_name_textbox}
    Clear Element Text          ${input_last_name_textbox}
    ${generated_name}=          generate_username               ${test_user.last_name}
    Input Text                  ${input_last_name_textbox}      ${generated_name}

generate_user_email
    Click Element               ${input_email_textbox}
    Clear Element Text          ${input_email_textbox}
    ${generated_email}=         generate_email
    Input Text                  ${input_email_textbox}          ${generated_email}

select_gender_radio
    ${user_gender}=                         get_gender_locator
    Click Element                           ${user_gender}

generate_phone_number
    Click Element               ${phone_number_textbox}
    Clear Element Text          ${phone_number_textbox}
    ${generated_phone}=         generate_phone
    Input Text                  ${phone_number_textbox}  ${generated_phone}

select_hobby_checkbox
    ${user_hobbie}=             check_sports_hobby
    Run Keyword If              "${user_hobbie}" != "None"  Click Element       ${user_hobbie}
    ${user_hobbie}=             check_reading_hobby
    Run Keyword If              "${user_hobbie}" != "None"    Click Element     ${user_hobbie}
    ${user_hobbie}=             check_music_hobby
    Run Keyword If              "${user_hobbie}" != "None"    Click Element     ${user_hobbie}

