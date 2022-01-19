# teste de busca de pesonagens na API

*Settings*
Documentation       Suite de Teste de busca de personagens na API da Marvel

Resource     ${EXECDIR}/resources/Base.robot   
Library      ${EXECDIR}/resources/factories/Xmen.py


#roda antes de cada teste
Suite Setup        Super Setup      vet.fml@gmail.com  

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