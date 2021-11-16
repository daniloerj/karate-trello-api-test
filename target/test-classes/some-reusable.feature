Feature: test script for post method of the board resource
  Background: config
    * url _url

  @createBoard
  Scenario: create a new board
    Given path '1','boards'
    And params {key:#(_key), token:#(_token)}
    And request requestVar
    When method post
    #Then status 200
    #And assert responseTime <tiempoRespuesta
#    And assert responseType == 'json'
#    And match response contains {name:'#string'}
#    And match responseHeaders['Content-Type'][0] contains 'application/json'
#    And assert responseStatus == 200

  @createBoardWithoutAsserts
  Scenario: create a new board
    Given path '1','boards'
    And params {key:#(_key), token:#(_token)}
    #And params {key:#(_key)}
    And request requestVar
    When method post
    #Then status 200
    And assert responseTime <tiempoRespuesta

  @deleteBoard
  Scenario: delete a board
      Given path '1','boards',boardId
      And params {key:#(_key), token:#(_token)}
      When method delete
      Then status 200