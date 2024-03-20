*** Settings ***
Documentation        Ações e elementos da tela minha conta

Library        AppiumLibrary

*** Keywords ***
User is logged in
    ${element}        Set Variable        xpath=//android.widget.TextView[@resource-id="myAccountTitle"]

    Wait Until Element Is Visible        ${element}        30
    Element Text Should Be             ${element}        Sua transformação começa aqui!