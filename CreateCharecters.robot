*Settings*
Documentation       Suite de Teste do cadastro de personagens da API da Marvel

Library     RequestsLibrary

*Test Cases*
Deve cadastrar um personagens

    #gerando token

    &{usuario}      Create Dictionary        email=vet.fml@mail.com

    ${response}     POST        http://marvel.qaninja.academy/accounts        json=${usuario}

    ${cliente_key}      Set Variable        ${response.json()}[cliente_key]

    # &{personagens}      Create Dictionary        name=Thanos de Titã     aliases=Thanos      age=3000        tean=Ordem Negra        active=False

    # POST        http://marvel.qaninja.academy/characters        json=${personagens}
