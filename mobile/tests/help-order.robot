*** Settings ***
Documentation        Suite de testes de pedido de ajuda

Resource    ../resources/base.resource
Resource    ../resources/services/enrolls.resource

Test Setup        Start App
Test Teardown     Finish App
Library    Browser

*** Test Cases ***
Deve poder solicitar ajuda
    
    ${admin}      Get Fixtures    admin
    ${josemar}    Get Fixtures    josemar

    Reset Student        ${josemar}[student][email]

    ${token}             Get Service Token    ${admin}   
    ${student_id}        Post New Student     ${token}    ${josemar}[student]
    Post New Enroll      ${token}             ${student_id}   

    Login With Student Id            ${student_id}
    Wait Until Element Is Visible    id=android:id/button1     10
    Click Element                    id=android:id/button1   

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Pedir ajuda"]     10
    Click Element                    xpath=//android.widget.TextView[@text="Pedir ajuda"]   
    
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Enviar dúvida"]     10
    Click Element                    xpath=//android.widget.TextView[@text="Enviar dúvida"]   
    
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text='Escreva sua dúvida aqui']    10
    Input Text                       xpath=//android.widget.EditText[@text='Escreva sua dúvida aqui']    ${josemar}[help]
    Click Text                       Enviar

    Wait Until Page Contains         Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.        10    
