*** Settings *** 
Resource         ../resources/main.robot
Test Setup       Dado que o usuário acesse o Organo
Test Teardown    Ao final feche a pagina


*** Test Cases ***
Abrir o Organo não preencher o formulario e clicar no botao entao uma mensagem de erro devera aparecer
    Dado que o usuario clique no botao ser preencher nenhum dos campos obrigatorios  
    Entao as mensagens que erro deverao aparecer








