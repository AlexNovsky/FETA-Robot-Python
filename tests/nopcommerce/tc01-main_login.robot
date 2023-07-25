*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}      chrome
${base_url}     https://demo.nopcommerce.com
${email}        pythonminutes@gmail.com
${pwd}          PythonMinutes

*** Test Cases ***
LoginTest
    open Browser        ${base_url}  ${browser}
    CheckMainPage
    LoginToApp
    Close Browser

*** Keywords ***
checkMainPage
    Title Should Be                       nopCommerce demo store
    Wait Until Element Is Visible         //ul[@class='top-menu notmobile']

loginToApp
    Click Element       //a[@class='ico-login']
    Element Should Be Visible    //input[@id='Email']
    Element Should Be Visible    //input[@id='Password']
    Set Focus To Element         //input[@id='Email']
    Clear Element Text           //input[@id='Email']
    Input Text                   //input[@id='Email']  ${email}
    Set Focus To Element         //input[@id='Password']
    Clear Element Text           //input[@id='Password']
    Input Text          //input[@id='Password']  ${pwd}
    Element Should Be Visible    //*[@id='RememberMe']
    Click Element    //*[@id='RememberMe']
     Click Element    //*[@id='RememberMe']
    Click Button        //button[@class='button-1 login-button']

