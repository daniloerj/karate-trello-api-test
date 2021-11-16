Feature: boards resource test script
  Background:
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users'
    When method get
    Then status 200
    * def data = response
    * url _url
    * def payload = read('classpath:some-classpath-payload.json')
    * def payload = karate.jsonPath(payload,"$[?(@.scenario=='smoke')]")[0]
    * print payload
    * def requestVar = payload.requestCreateBoard
    * def transactionId = 'trans-'+'122ee234234'
    * configure headers = _headers
    * def jsonData = read('classpath:data/jph.json')
    * def cadenaDeNumeros = "1|2|3|4|5|6|7|8|9|10"
    * def functionJS = read('classpath:some-classpath-function.js')
    * def resultadoSuma = functionJS(cadenaDeNumeros,'|')
    * print resultadoSuma

  @regresion @release @clase
  Scenario: Create a new board
    * def path = 'smoke'
    * def tiempoRespuesta = 1000
    * def jsonStructureResponse = read('template-create-board.json')

    #* def boardResponse = call read('classpath:some-reusable.feature@createBoard')
    * def varTag = (path=='smoke') ? '@createBoardWithoutAsserts' : '@createBoard'
    * def boardResponse = call read('classpath:some-reusable.feature'+varTag)
    * def boardId = boardResponse.response.id
#    * assert boardResponse.response.name == payload.requestCreateBoard.name
#    * match boardResponse.response contains {id:'#string'}
#    * assert boardResponse.responseStatus == 200
#    * print boardResponse
#    #* assert boardResponse.responseTime <1000
#    * assert boardResponse.responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
#    * match boardResponse.responseHeaders['Content-Type'][0] contains 'application/json'
#    * match boardResponse.response contains jsonStructureResponse
#
    * def result = boardResponse.responseStatus == 200 ? karate.call('classpath:some-reusable.feature@deleteBoard') : {}
    * print result


    * def ra = Java.type('Utiles')
    * def random = ra.getRandomNumber()
    * print random
    * print ra.saludar()
    * print ra.getMessage('danilo efrain')

  @regresion
  Scenario:  update a board
    * def boardResponse = call read('classpath:some-reusable.feature@createBoard')
    * def boardId = boardResponse.response.id

    * requestVar.name = 'UpdateFromKarate'

    Given path '1','boards',boardId
    And params {key:#(_key), token:#(_token)}
    And request requestVar
    When method put
    Then status 200

    Given path '1','boards',boardId
    And params {key:#(_key), token:#(_token)}
    When method delete
    Then status 200

  @regresion
  Scenario: get a board
    * def boardResponse = call read('classpath:some-reusable.feature@createBoard')
    * def boardId = boardResponse.response.id

    Given path '1','boards',boardId
    And params {key:#(_key), token:#(_token)}
    When method get
    Then status 200
    And response.name == 'CreateFromKarate'

    Given path '1','boards',boardId
    And params {key:#(_key), token:#(_token)}
    When method delete
    Then status 200

  @smoke
  Scenario Outline: Create a new board from api response
    * requestVar.name = '<name>'
    * def boardResponse = call read('classpath:some-reusable.feature@createBoard')
    * def boardId = boardResponse.response.id

    Given path '1','boards',boardId
    And params {key:#(_key), token:#(_token)}
    When method delete
    Then status 200
    Examples:
      |karate.jsonPath(data,"$[?(@.id>6)]")|

  @smoke
  Scenario Outline: create a new board from json data
      * requestVar.name = '<name>'
    * def boardResponse = call read('classpath:some-reusable.feature@createBoard')
      * def boardId = boardResponse.response.id

      Given path '1','boards',boardId
      And params {key:#(_key), token:#(_token)}
      When method delete
      Then status 200

      Examples:
      |karate.jsonPath(jsonData,"$[?(@.id<4)]")|
