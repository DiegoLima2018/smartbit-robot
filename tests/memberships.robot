*** Settings ***
Documentation        suite de testes de adesões de planos

Resource        ../resources/Base.resource

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

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    SignIn admin    
    Go to memberships
    Create new membership      ${data}
    Sleep    8
    Create new membership      ${data}
    Toast should be            O usuário já possui matrícula.