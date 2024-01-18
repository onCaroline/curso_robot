*** Settings *** 
Resource         ../resources/main.robot
Test Setup       Dado que o usuário acesse o Organo
Test Teardown    Ao final feche a pagina




*** Test Cases ***
Teste 1 Abrir navegador e acessar o site do Organo e preencher o cadastro com sucesso e validando a criação correta do card
    Dado que o usuario preencheu os campos corretamente
    E clique no botao criar card
    Então o card de identificacao devera ser criado

Teste 2 Abrir o navegador e acessar o site do Organo e preencher o cadastro com sucesso três vezes portanto três card serão criados
    Dado que o usuario preencheu os campos corretamente
    E clique no botao criar card
    Criar mais tres cards com sucesso 

Teste 3 Abrir o navegador e acessar o site do Organo e preencher o cadastro com sucesso utilizando todos os cargos disponiveis 
    Dado que o usuario preencheu os campos corretamente
    Então será criado um usuario para cada cargo disponivel 







    





