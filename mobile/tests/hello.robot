*** Settings ***
Documentation        Exemplo Robot + appium

Library    AppiumLibrary

*** Test Cases ***

Deve abrir o app da smartbit
    
    Open Application    http://localhost:4723/wd/hub
    ...                 alias=Smartbit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Virtual
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Sleep    5

    Close Application
