*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...            //option[contains(.,'Programação')]
...            //option[contains(.,'Front-End')]
...            //option[contains(.,'Data Science')]
...            //option[contains(.,'Devops')] 
...            //option[contains(.,'UX e Design')]
...            //option[contains(.,'Mobile')]
...            //option[contains(.,'Inovação e Gestão')]
${ERRO_CAMPO_NOME}     id:form-nome-erro
${ERRO_CAMPO_CARGO}    id:form-cargo-erro
${ERRO_CAMPO_TIME}     id:form-times-erro
${CLIQUE_BOTAO}        id:form-botao

*** Keywords ***
Dado que o usuario preencheu os campos corretamente
    ${Nome}    FakerLibrary.First Name
    Input Text    ${CAMPO_NOME}    ${Nome} 
    ${Cargo}    FakerLibrary.Job
    Input Text    ${CAMPO_CARGO}    ${Cargo}
    ${Imagem}    FakerLibrary.Image Url    width=100    height=100
    Input Text    ${CAMPO_IMAGEM}    ${Imagem} 
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[0]

E clique no botao criar card
...    Click Element    ${BOTAO_CARD}

Então o card de identificacao devera ser criado
...    Element Should Be Visible    class:colaborador

Criar mais tres cards com sucesso
    FOR    ${x}    IN RANGE    1     3
        Dado que o usuario preencheu os campos corretamente
        E clique no botao criar card
        Então o card de identificacao devera ser criado  
    END
    Sleep    10s 

Então será criado um usuario para cada cargo disponivel
    FOR    ${indice}    ${element}    IN ENUMERATE    @{selecionar_times}
            Dado que o usuario preencheu os campos corretamente
            Click Element    ${element}
            E clique no botao criar card    
    END
    Sleep    30s 
    
Dado que o usuario clique no botao ser preencher nenhum dos campos obrigatorios
    Click Element    ${CLIQUE_BOTAO}

Entao as mensagens que erro deverao aparecer
    Element Should Be Visible    ${ERRO_CAMPO_NOME} 
    Element Should Be Visible    ${ERRO_CAMPO_CARGO}
    Element Should Be Visible    ${ERRO_CAMPO_TIME}
