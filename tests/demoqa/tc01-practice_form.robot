*** Settings ***
Library  SeleniumLibrary
Variables   resources/demoqa/data/demoqa_data.yaml
Resource    resources/common/common_web.resource
Resource    resources/demoqa/pages/practice_form.resource

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${uri}     ${base_url}/automation-practice-form     #Configurable URI for Practice form with base_url var from yaml

*** Test Cases ***
Verify Practice form loaded
    Go To                                   ${uri}
    practice_form.verify_happy_elements

Fill Practice form with generated credentials
    practice_form.generate_first_name
    practice_form.generate_last_name
    practice_form.generate_user_email
    practice_form.generate_phone_number
    practice_form.select_gender_radio
    practice_form.select_hobby_checkbox
    practice_form.enter_address
#    practice_form.select_state
#    practice_form.select_city
#    practice_form.submit_form
    Sleep  5
