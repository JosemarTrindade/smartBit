*** Settings ***
Documentation        Keywords que representa a página de matrículas

Library    Browser
Library    libs/DateTricks.py

*** Keywords ***

Go To Enrolls  
    Click        css=a[href="/matriculas"]

Go To Enrolls Form
    Click        css=a[href="/matriculas/new"]

Select Student
    [Arguments]    ${student_name}
    Fill Text    xpath=//div[contains(text(),"nome do aluno")]/..//input
    ...    	     ${student_name}
    Click        css=div[class$=option] >> text=${student_name}

Select Plan
    [Arguments]    ${plna_name}
    Click        xpath=//label[text()="PLANO"]/..//div[contains(text(),"Selecione")]
    Click        css=div[class$=option] >> text=${plna_name}

Fill Start Date
    [Arguments]    
    
    Focus    css=input[name=start_date]

    ${start_date}    Get Start Date    
    
    FOR     ${number}    IN    @{start_date}
        Keyboard Key    press    ${number} 
    END

Submit Enroll Form
    
    Click    css=button >> text=Salvar
    
