*** Settings ***
Documentation        Gerenciando a massa de teste atraves do banco de dados

Library        DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database        psycopg2
    ...                        mqrviumt
    ...                        mqrviumt
    ...                        45M3JLTtCAjbdRLJV66kHkZj1ufru_86
    ...                        babar.db.elephantsql.com
    ...                        5432

Select Student WHERE Email
    [Arguments]        ${email}

    ${query}        Set Variable        
    ...             select * FROM public.students WHERE email = '${email}';    

    ${result}    Query    ${query}   

    [Return]    ${result}[0][0] 

Delete Enroll By Email
    [Arguments]    ${email}   

    ${user}        Select Student WHERE Email    ${email}     

    ${query}       Set Variable
    ...            DELETE FROM public.enrollments WHERE student_id = ${user};

    Execute Sql String    ${query}

Delete Student By Email
    [Arguments]        ${email}

    ${query}     Set Variable   
    ...          delete FROM "public"."students" WHERE email= '${email}'

    Execute Sql String    ${query}

Reset Student 
    [Arguments]        ${email}
    Connect To Postgres
    Delete Student By Email    ${email}
    Disconnect from Database  

