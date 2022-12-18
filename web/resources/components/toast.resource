*** Settings ***
Documentation        Representação do componente toast

Library    Browser

*** Keywords ***
Verify Toaster
    [Arguments]        ${expected_message}
    Wait For Elements State
    ...    css=.Toastify__toast-body >> text=${expected_message}
    ...    visible    15

    Wait For Elements State
    ...    css=.Toastify__toast-body
    ...    detached    10