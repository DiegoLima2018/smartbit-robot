*** Settings ***
Documentation        suite de testes de adesões de planos

Resource        ../resources/Base.resource
Resource    ../resources/pages/memberships.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    ${data}    Get Json fixture    memberships    create
    
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    SignIn admin    
    Go to memberships
    Create new membership      ${data}
    Toast should be            Matrícula cadastrada com sucesso.

Não deve realizar adesão duplicada
    [Tags]    dup

    ${data}    Get Json fixture    memberships    duplicate

    Insert membership    ${data}

    SignIn admin    
    Go to memberships
    Create new membership      ${data}
    Toast should be            O usuário já possui matrícula.

Deve buscar por nome
    [Tags]    search

    ${name}        Set Variable        Wellington Avon

    SignIn admin
    Go to memberships
    Search by name           ${name}
    Should filter by name    ${name} 