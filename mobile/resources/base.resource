*** Settings ***
Documentation        Arquivo principal

Library    AppiumLibrary
Library    JSONLibrary

Resource    screens/login.resource
Resource    screens/help.resource
Resource    screens/components/popup.resource
Resource    screens/components/footer.resource

Resource    services/sessions.resource
Resource    services/student.resource

Resource    database.resource



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

    Wait Until Page Contains    Informe seu código de acesso        60        

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