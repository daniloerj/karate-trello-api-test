Feature: test
  Background: config

    Scenario: test
      Given url 'https://reqres.in/'
      And path 'api','login'
      And request { email: 'eve.holt@reqres.in', password: 'cityslicka'}
      When method post
      Then status 200
      * def statusCode = responseStatus
      And match response == { token: '#string'}
      * def token = response.token

      Given url 'https://jsonplaceholder.typicode.com/users/1'
      And header Authorization = 'Bearer '+token
      When method get
      Then status 200

      Given url 'https://jsonplaceholder.typicode.com/users/1'
      And form field client_id = 'dasdasdasdasdasdafdfdsafds'
      And form field client_secret = 'e212ernfwdkw'
      And form field token = 'token'
      When method get
      Then status 200