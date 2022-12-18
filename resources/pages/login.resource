*** Settings ***
Library   Browser

*** Keywords ***
Go to login page

    New Browser     headless=false    browser=chromium
    New Page        http://localhost:3000
    
Fill Credencials
    [Arguments]        ${email}    ${password}

    Fill Text    css=input[name='email']       ${email}
    Fill Text    css=input[name='password']    ${password}

Submit Credentials
    Click               css=button >> text=Entrar no sistema

Field type Should Be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]
    ...   type    equal    email

Alert Text Should Be
    [Arguments]         ${field}        ${expected_message}

    Wait For Elements State    css=span >> text=${expected_message} 
    ...                        visible    5

    Get Text    xpath=//input[@type='${field}']/../span 
    ...        equal        ${expected_message}  