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
    Create new membership           ${data}
    Toast should be                 O usuário já possui matrícula.

Deve buscar por nome
    [Tags]    search

    ${data}        Get Json fixture    memberships    search

    Insert Membership               ${data}

    SignIn admin
    Go to memberships
    Search by name                  ${data}[account][name]
    Should filter by name           ${data}[account][name]

Deve excluir uma matricula
    [Tags]    remove

    ${data}        Get Json fixture    memberships    remove

    Insert Membership               ${data}

    SignIn admin
    Go to memberships
    Request removal                 ${data}[account][name]
    Confirm removal
    Membership should be visible    ${data}[account][name]
    