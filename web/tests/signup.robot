*** Settings ***
Documentation        Cenários de testes de pré-cadastro de cliente

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro de cliente
    [Tags]    smoke

    ${account}        Create Dictionary    
    ...    name=Diego Lima    
    ...    email=diegolima@teste.com.br    
    ...    cpf=99414605070

    Delete Account By Email    ${account}[email]
    Submit signup form         ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Template]        Attempt signup
    ${EMPTY}                galdino.silva@teste.com        11809003083        Por favor informe o seu nome completo
    Wellington Silva        ${EMPTY}                       32218868024        Por favor, informe o seu melhor e-mail
    Neire Fernandes         neire.fernandes@teste.com      ${EMPTY}           Por favor, informe o seu CPF
    Diego Lima              diego.lima*teste.com.br        00255108001        Oops! O email informado é inválido
    Paulo Silva             paulo.silva@teste.com.br       7319756005&        Oops! O CPF informado é inválido


*** Keywords ***
Attempt signup
    [Arguments]        ${name}        ${email}        ${cpf}        ${output_message}
    
    ${account}        Create Dictionary    
    ...    name=${name}
    ...    email=${email}    
    ...    cpf=${cpf}

    Submit signup form      ${account}
    Notice should be        ${output_message}