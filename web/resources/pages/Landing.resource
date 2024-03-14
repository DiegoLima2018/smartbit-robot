*** Settings ***
Documentation        Ações e elementos da Landing Page

Library        Browser

*** Keywords ***
Submit signup form
    [Arguments]        ${account}
    
    #Busca de elementos com CSS selector
    Get Text        css=#signup h2       equal        Faça seu cadastro e venha para a Smartbit!
    
    #Busca de elementos com ID Attribute
    Fill Text        id=name            ${account}[name]
    Fill Text        id=email           ${account}[email]
    Fill Text        id=cpf             ${account}[cpf]

    #Busca de um elemento com a combinação de localizadores 
    Click            css=button >> text=Cadastrar