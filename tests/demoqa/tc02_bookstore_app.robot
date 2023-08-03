*** Settings ***
Library  SeleniumLibrary
Variables   resources/demoqa/data/demoqa_data.yaml
Resource    resources/common/common_web.resource
Resource    resources/demoqa/pages/book_store.resource

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${uri}     ${base_url}/login     #Configurable URI for Practice form with base_url var from yaml

*** Test Cases ***
Verify Practice form loaded
    Go To                                   ${uri}
    book_store.check_happy_elements_login

check_wrong_login
    book_store.check_invalid_login

register_new_user
    book_store.create_new_user