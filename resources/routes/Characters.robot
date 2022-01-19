*Settings*

Documentation           Ações da rota /characters


*Keywords*
POST New Character
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${API_URI}/characters
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [return]        ${response}

GET Character By Id
    [Arguments]     ${characters_Id}

    ${response}     GET
    ...             ${API_URI}/characters/${characters_Id}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [return]        ${response}