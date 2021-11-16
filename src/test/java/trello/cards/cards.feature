Feature: test script cards resource
  Background:
    * url _url
    * def payload = read('classpath:some-classpath-payload.json')
    * def payload = karate.jsonPath(payload,"$[?(@.scenario=='smoke')]")[0]
    * def requestVar = payload.requestCreateBoard
    * def cadenaDeNumeros = "1|2|3|4|5|6|7|8|9|10"
    * def functionJS = read('classpath:some-classpath-function.js')

    * def resultadoSuma = functionJS(cadenaDeNumeros,'|')
    * print resultadoSuma

    @smoke
    Scenario: Create a card
      * def boardResponse = call read('classpath:some-reusable.feature@createBoard')
      * def boardId = boardResponse.response.id