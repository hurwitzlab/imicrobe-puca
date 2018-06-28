*** settings ***
Library  Collections
Library  requests
Library  agave  agave.iplantc.org jklynch
*** test cases ***
simpleRequest
    ${result} =  get  http://echo.jsontest.com/framework/robot-framework/api/rest
    Should Be Equal  ${result.status_code}  ${200}
    ${json} =  Set Variable  ${result.json()}
    ${framework} =  Get From Dictionary  ${json}  framework
    Should Be Equal  ${framework}  robot-framework
    ${api} =  Get From Dictionary  ${json}  api
    Should Be Equal  ${api}  rest

agaveAuth
    ${result} =  get  https://agave.iplantc.org
    Should Be Equal  ${result.status_code}  ${200}
    ${json} =  Set Variable  ${result.json()}
    ${framework} =  Get From Dictionary  ${json}  framework
    Should Be Equal  ${framework}  robot-framework
    ${api} =  Get From Dictionary  ${json}  api
    Should Be Equal  ${api}  rest
