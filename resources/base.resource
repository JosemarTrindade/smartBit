*** Settings ***
Documentation        Tudo começa aqui

Resource        components/navbar.resource
Resource        components/toast.resource
Resource        pages/login.resource
Resource        components/enroll.resource


*** Keywords ***
# Helpers
Do login
    [Arguments]        ${user}

    Go to login page
    Fill Credencials       ${user}[email]       ${user}[pass]
    Submit Credentials
    User Should be logged in    ${user}[name]