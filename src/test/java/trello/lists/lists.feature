Feature: test script cards resource
  Background:
    * url _url
    * def payload = read('classpath:some-classpath-payload.json')
    * def requestVar = payload.requestCreateBoard
    * def cadenaDeNumeros = "1|2|3|4|5|6|7|8|9|10"
    * def functionJS =
    """
    function sumaCadena(cadena,separador){
      var array = cadena.split(separador);
      var result = 0;
      for (let index = 0; index < array.length; index++) {
        result = result + parseInt(array[index]);
      }
      return result
    }
    """

    * def resultadoSuma = functionJS(cadenaDeNumeros,'|')
  @smoke
  Scenario: Create a card
    * def boardResponse = call read('classpath:some-reusable.feature@createBoard')
    * def boardId = boardResponse.response.id