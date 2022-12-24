*** Settings ***
Documentation        Arquivo principal

Library    AppiumLibrary
Library    JSONLibrary

*** Variables ***
${API_URL}        http://192.168.0.10:3333

*** Keywords ***
Start App
    Open Application    http://localhost:4723/wd/hub
    ...                 alias=Smartbit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Virtual
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Wait Until Page Contains    Informe seu código de acesso    

Finish App
    Capture Page Screenshot
    Close Application

## Helpers

Get Fixtures
    [Arguments]    ${fixture_file}

    ${fixture}        Load Json From File    
    ...               ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...               encoding=UTF-8

    [Return]          ${fixture}   