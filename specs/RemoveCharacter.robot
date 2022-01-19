# teste de DELETE de pesonagens na API

*Settings*
Documentation       Suite de Teste de busca de personagens na API da Marvel

Resource     ${EXECDIR}/resources/Base.robot   
Library      ${EXECDIR}/resources/factories/Xmen.py


#roda antes de cada teste
Suite Setup        Super Setup      user@gmail.com  

*Test Cases*

Deve remover um personagem pelo Id

    ${personagem}           Factory Rogue
    ${rogue}                POST New Character  ${personagem}
    ${rogue_id}             Set Variable        ${rogue.json()}[_id]

    ${response}             DELETE Character By Id  ${rogue_id}

    Status Should Be            204     ${response}

     ${response2}           GET Character By Id  ${rogue_id} 

    Status Should Be            404     ${response2}

Não deve retornar personagem por Id

    ${personagem_id}       Get Unique Id 

    ${response}         DELETE Character By Id      ${personagem_id}

    Status Should Be            404     ${response}
    