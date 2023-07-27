*** Settings ***
Library  SeleniumLibrary
Variables   resources/demoqa/data/demoqa_data.yaml
Resource    resources/common/common_web.resource
Resource    resources/demoqa/pages/practice_form.resource

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${uri}     ${base_url}/automation-practice-form

*** Test Cases ***
Verify Practice form loaded
    Go To                                   ${uri}
#    practice_form.verify_happy_elements

Fill Practice form with generated credentials
    practice_form.generate_first_name
    practice_form.generate_last_name
    practice_form.generate_user_email
    practice_form.generate_phone_number
    practice_form.select_gender_radio
    practice_form.select_hobby_checkbox
    Sleep  3

#Fill Practice form with defined credentials
#    practice_form.enter_first_name
#    practice_form.enter_last_name
#    practice_form.enter_email
#    practice_form.enter_phone
#    Sleep  3
