*** Settings ***
Documentation        Tudo começa aqui

Resource        components/navbar.resource
Resource        components/toast.resource
Resource        pages/login.resource
Resource        pages/enroll.resource

Resource        services/sessions.resource
Resource        services/student.resource

Resource        database.resource

Library         JSONLibrary


*** Keywords ***
# Helpers
Do login
    [Arguments]        ${user}

    Go to login page
    Fill Credencials       ${user}[email]       ${user}[password]
    Submit Credentials
    User Should be logged in    ${user}[name]

Get Fixtures
    [Arguments]    ${fixture_file}   

    ${fixture}     Load Json From File    
    ...            ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...            encoding=UTF-8

    [Return]        ${fixture} 