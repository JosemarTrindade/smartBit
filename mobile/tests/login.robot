*** Settings ***
Documentation        Suite de testes de Login

Resource    ../resources/base.resource

Test Setup        Start App
Test Teardown     Finish App

*** Variables ***
${error_401}        Acesso não autorizado! Entre em contato com a equipe de atendimento.

*** Test Cases ***
Deve logar com sucesso
    
    ${falcao}     Get Fixtures    falcao
    
    Login With Student Id        ${falcao}[student][id]
    Wait Until Page Contains     Olá, ${falcao}[student][name]!

Código de aluno incorreto
    
    Login With Student Id            99999999
    Wait Until Page Contains         ${error_401}        10
    
Código de aluno negativo
    
    Login With Student Id            -1
    Wait Until Page Contains         ${error_401}        10 

Código de aluno alfanumérico
    
    Login With Student Id            abc123
    Wait Until Page Contains         ${error_401}        10      

Código de aluno não informado
    Login With Student Id            ${EMPTY} 
    Wait Until Page Contains         Por favor informe o seu código de acesso!


# Por favor informe endereço da API!



    
