
*Settings*
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource     ${EXECDIR}/resources/Base.robot   
Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem

    Set Client Key     vet.fml@gmail.com

    &{personagem}       Factory Thanos

    ${response}     POST
    ...             http://marvel.qaninja.academy/characters
    ...             json=${personagem}
    ...             headers=${headers}

    Status Should Be        200     ${response}


