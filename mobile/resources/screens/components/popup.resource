*** Settings ***
Documentation        Componente que representa o pop up 

Library        AppiumLibrary

*** Variables ***
${ok_button}        id=android:id/button1

*** Keywords ***
Confirm Popup
    
    Wait Until Element Is Visible    ${ok_button}     10
    Click Element                    ${ok_button}   