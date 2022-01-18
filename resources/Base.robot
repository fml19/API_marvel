*Settings*
Documentation       Aqui é o começo

Library         RequestsLibrary

Resource        routes/Characters.robot

#Aproveitando URI
*Variables*
${API_URI}     http://marvel.qaninja.academy

*Keywords*
Super Setup
    [Arguments]         ${email}
    Set Client Key      ${email}
    Back To The Past

Set Client Key
    [Arguments]         ${email}

    &{usuario}          Create Dictionary       email=${email}

    ${response}         POST
    ...                 ${API_URI}/accounts
    ...                 json=${usuario}

    ${client_key}       Set Variable            ${response.json()}[client_key]
    &{HEADERS}          Create Dictionary       client_key=${client_key}

    Set Suite Variable      ${HEADERS}

#Apagar repositório antes de realizar o teste para não dar duplicata
Back To The Past
    DELETE      ${API_URI}/delorean         headers=${HEADERS}
