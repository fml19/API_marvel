# teste de busca de pesonagens na API

*Settings*
Documentation       Suite de Teste de busca de personagens na API da Marvel

Resource     ${EXECDIR}/resources/Base.robot   
Library      ${EXECDIR}/resources/factories/Xmen.py


#roda antes de cada teste
Suite Setup        Super Setup      user@gmail.com  

*Test Cases*

Deve buscar um personagem pelo Id

    ${personagem}           Factory Rogue
    ${rogue}                POST New Character  ${personagem}
    ${rogue_id}             Set Variable        ${rogue.json()}[_id]

    ${response}             GET Character By Id  ${rogue_id}

    Status Should Be            200     ${response}

    Should Be Equal             ${rogue.json()}[name]         ${personagem}[name]
    Should Be Equal             ${rogue.json()}[age]          ${personagem}[age]
    Should Be Equal             ${rogue.json()}[aliases]      ${personagem}[aliases]
    Should Be Equal             ${rogue.json()}[team]         ${personagem}[team]  

Não deve retornar personagem por Id

    # ${personagem_id}        Set Variable        61e8619a3f6c5d0016311729
    #                           ou
    ${personagem_id}       Get Unique Id 

    ${response}         GET Character By Id      ${personagem_id}

    Status Should Be            404     ${response}
    #Should Be Equal      ${response.json()}[error]      No body returned for response