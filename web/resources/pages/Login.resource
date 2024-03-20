*** Settings ***
Documentation        Ações e elementos da página de Login

Variables      ../env.py

Library        Browser

*** Keywords ***
Go to login Page
    
    Go To    ${BASE_URL}/login

Submit login form
    [Arguments]        ${email}        ${password}

    Fill Text    css=input[name=email]        ${email}
    Fill Text    css=input[name=password]     ${password}

    Click    css=button >> text=Entrar