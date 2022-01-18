
*Settings*
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource     ${EXECDIR}/resources/Base.robot   
Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem

    Set Client Key     vet.fml@gmail.com

    &{personagem}       Factory Thanos

    ${response}     POST
    ...             ${API_URI}/characters
    ...             json=${personagem}
    ...             headers=${headers}
    ...             expected_status=any

    Status Should Be        200     ${response}

#Validação da regra de negocio onde não deve ter duplicada
Não deve cadastrar o mesmo nome  

    #Dado que Thanos no sistema
    ${personagem}       Factory Thanos

    POST        ${API_URI}/characters
    ...         json=${personagem}
    ...         headers=${HEADERS}
    ...         expected_status=any

    #Quando faço uma requisição POST para a rota characters
    ${response}       POST

    ...         ${API_URI}/characters
    ...         json=${personagem}
    ...         headers=${HEADERS}
    ...         expected_status=any

    #Então o código de retorno deve ser 409
    Status Should Be            409     ${response}

    

