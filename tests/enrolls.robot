*** Settings ***
Documentation        Suite de teste de matrículas de alunos

Resource    ../resources/base.resource



*** Test Cases ***        
Deve matricular um aluno

    ${admin}        Get Fixtures    admin            
    ${student}      Get Fixtures    student 
    
    Reset Student Enroll    ${student}[email]
    Do login    ${admin}

    Go To Enrolls  
    Go To Enrolls Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date   
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso


