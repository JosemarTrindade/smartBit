*** Settings ***
Documentation        Suite de testes de pedido de ajuda

Resource    ../resources/base.resource
Resource    ../resources/services/enrolls.resource

# Test Setup        Start App
# Test Teardown     Finish App

*** Test Cases ***
Deve poder solicitar ajuda
    
    ${admin}      Get Fixtures    admin
    ${josemar}    Get Fixtures    josemar

    Reset Student        ${josemar}[student][email]

    ${token}             Get Service Token    ${admin}   
    ${student_id}        Post New Student     ${token}    ${josemar}[student]
    Post New Enroll      ${token}        ${student_id}    