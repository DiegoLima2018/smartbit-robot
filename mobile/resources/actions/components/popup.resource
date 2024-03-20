*** Settings ***
Documentation        Ações e elementos do componente Popup

Library        AppiumLibrary

*** Keywords ***
Popup have Text
    [Arguments]        ${target}
    
    ${element}         Set Variable        xpath=//android.widget.TextView[@resource-id="android:id/message"]

    Wait Until Element Is Visible    ${element}        5
    Element Text Should Be           ${element}        ${target}