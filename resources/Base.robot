*Settings*
Documentation       Aqui é o começo

Library         RequestsLibrary

#Aproveitando URI
*Variables*
${API_URI}     http://marvel.qaninja.academy

*Keywords*
Set Client Key
    [Arguments]         ${email}

    &{usuario}          Create Dictionary       email=${email}

    ${response}         POST
    ...                 ${API_URI}/accounts
    ...                 json=${usuario}

    ${client_key}       Set Variable            ${response.json()}[client_key]
    &{HEADERS}          Create Dictionary       client_key=${client_key}

    Set Suite Variable      ${HEADERS}