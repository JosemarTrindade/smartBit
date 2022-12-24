*** Settings ***
Documentation        Componente que representa o radapé

Library        AppiumLibrary

*** Variables ***
${ho_button}        xpath=//android.widget.TextView[@text="Pedir ajuda"]

*** Keywords ***
Go To Help Order
    Wait Until Element Is Visible    ${ho_button}          10
    Click Element                    ${ho_button}    