*** Settings ***
Documentation        Suite de teste de matrículas de alunos


Resource    ../resources/base.resource

*** Test Cases ***  
Deve matricular um aluno

    ${admin}        Get Fixtures    admin            
    ${falcao}       Get Fixtures    falcao 
    
    Reset Student    ${falcao}[student][email]

    ${token}     Get Service Token    ${admin}
    Post New Student    ${token}    ${falcao}[student]

    Do login    ${admin}

    Go To Enrolls  
    Go To Enrolls Form
    Select Student    ${falcao}[student][name]
    Select Plan       ${falcao}[enroll][plan]
    Fill Start Date   
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso


