Feature: verify posts of api for my first test

Background: Initlize stuff
    Given url 'https://jsonplaceholder.typicode.com'
Scenario: Verify /posts works
    Given path 'posts'
    When method get
    Then status 200
    And assert response.length == 100
    And assert responseTime < 1000
    * print responseCookies
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    And match response == '#array'
    And match response[0] == {"userId": '#number', "id": '#number', "title": '#string', "body": '#string'}
    And match response[*] contains {"userId": '1', "id": '1', "title": '#string', "body": '#string'}
    And match each response == {"userId": '#number', "id": '#number', "title": '#string', "body": '#string'}

Scenario: Verify /post/{uid} works
    Given path 'posts'
    And param userId = 1
    And header x-juujuju = 'yoreleiyiju'
    When method get
    Then status 200
    And asser response.length == 10

Scenario: Verify /post/{uid} works
    Given def uid = 1
    And path 'posts'
    And path uid
    When method get
    Then status 200
    And match response == 
    """
    {
        "userId": '#number',
        "id": '#(uid)',
        "title": '#string',
        "body": '#string'
    }
    """