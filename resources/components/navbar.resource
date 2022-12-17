*** Settings ***
Documentation        Representação do menu superior

Library    Browser

*** Keywords ***
User Should be logged in
    [Arguments]        ${name}
    ${logged_user}    Set Variable     css=aside strong    

    Wait For Elements State     ${logged_user}    visible     15

    Get Text    ${logged_user}     equal     ${name}    