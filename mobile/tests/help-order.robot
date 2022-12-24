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

    Login With Student id            ${student_id}
    Confirm Popup
    Go To Help Order
    Submint Help Order               ${josemar}[help]   
    Wait Until Page Contains         Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.        10    
