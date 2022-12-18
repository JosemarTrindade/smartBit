*** Settings ***
Documentation        Suite de teste de autenticação

Resource    ../resources/base.resource


*** Test Cases ***
Login do Administrador

    Go to login page
    Fill Credencials       admin@smartbit.com        qacademy
    Submit Credentials
    User Should be logged in    Admin

Email não cadastrado

    Go to login page
    Fill Credencials    404@smartbit.com    academy
    Submit Credentials
    Verify Toaster      Suas credenciais são inválidas, por favor tente novamente!

Senha inválida

    Go to login page
    Fill Credencials    admin@smartbit.com    abc123
    Submit Credentials
    Verify Toaster      Suas credenciais são inválidas, por favor tente novamente!  

Email no formato incorreto

    Go to login page
    Fill Credencials    @com.br    abc123
    Submit Credentials
    Field type Should Be Email

Senha em branco
    [Tags]        temp
    Go to login page
    Fill Credencials        admin@smartbit.com        ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

Email em branco
    [Tags]        temp
    Go to login page
    Fill Credencials        ${EMPTY}       qacademy
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório

Email e senha são obrigatórios
    [Tags]        temp
    Go to login page
    Submit Credentials  
    Alert Text Should Be    email    O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória

    

