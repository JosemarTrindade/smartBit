*** Settings ***
Documentation        Arquivo que representa a tela de ajuda

Library        AppiumLibrary

*** Variables ***
${help_button}        xpath=//android.widget.TextView[@text="Enviar dúvida"]
${help_text}          xpath=//android.widget.EditText[@text='Escreva sua dúvida aqui']

*** Keywords ***
Submint Help Order
    [Arguments]        ${text}
    Wait Until Element Is Visible    ${help_button}          10
    Click Element                    ${help_button}   

    Wait Until Element Is Visible    ${help_text}     10
    Input Text                       ${help_text}     ${text}
    Click Text                       Enviar