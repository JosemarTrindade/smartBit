*** Settings ***
Documentation        Suite de teste de matrículas de alunos

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    # Falcao Não mexer
    # Smart
    # 11/10/2022
    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com
    ...         pass=qacademy

    Do login    ${admin}
    Go To Enrolls  
    Go To Enrolls Form
    Select Student    Falcão Não mexer
    Select Plan       Smart
    Fill Start Date   

    Sleep     5

