
*Settings*
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource     ${EXECDIR}/resources/Base.robot   
Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem

    Set Client Key     vet.fml@gmail.com

   &{personagem}       Factory Thanos
   ${response}     POST New Character      ${personagem}  
    
    Status Should Be        200     ${response}

#Validação da regra de negocio onde não deve ter duplicada
Não deve cadastrar o mesmo nome  

    #Dado que Thanos no sistema
    ${personagem}       Factory Thanos
    POST New Character      ${personagem} 

    #Quando faço uma requisição POST para a rota characters
    ${response}      POST New Character      ${personagem} 

    #Então o código de retorno deve ser 409
    Status Should Be            409     ${response}
    Should Be Equal      ${response.json()}[error]      Character already exists :(
    

