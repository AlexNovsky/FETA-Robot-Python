*** Settings ***
Library  SeleniumLibrary
Variables    resources/demoqa/data/demoqa_data.yaml

*** Variables ***


*** Keywords ***
Begin Web Test
    open browser  about:blank  ${BROWSER}

End Web Test
    close browser