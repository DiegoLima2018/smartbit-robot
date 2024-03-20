*** Settings ***
Documentation        Suite de testes de Login

Resource        ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve logar com cpf e IP

    ${data}        Get Json fixture    login

    Insert Membership    ${data}
    
    SignIn with document    ${data}[account][cpf]
    User is logged in

Não deve logar com cpf não cadastrado

    SignIn with document    47916550016
    Popup have Text         Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com cpf com digito inválido
    [Tags]    temp

    SignIn with document    00000014144
    Popup have Text         CPF inválido, tente novamente