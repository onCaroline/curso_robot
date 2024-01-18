*** Settings ***
Resource    ../main.robot

*** Keywords ***
Dado que o usuário acesse o Organo 
...    Open Browser    url=http://localhost:3000/    browser=Chrome 

Ao final feche a pagina
    Close Browser   