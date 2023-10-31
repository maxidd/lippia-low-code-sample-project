Feature: Clockify

  Background:
    And header x-api-key = YTRjZDAzMjQtNGQ1NS00OTY4LWFmODgtN2EwY2RkMzAxNGIx
    And header Content-Type = application/json

  @ListWokrspaces
  Scenario: Obtener espacios de trabajo
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
    And validar schema allWokrspaces.json
    * define id = $.[2].id
    And defino una variable con nombre idWorkspace que contenga el id de workspace cuyo nombre es new workspace


  @ListClients @prueba2
  Scenario: Obtener clientes por espacio de trabajo
    Given call Clockify_2.feature@ListWokrspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/clients
    And header Accept = */*
    When execute method GET
    Then the status code should be 200



  Scenario Outline: Agregar Cliente a Espacio de Trabajo
    Given call Clockify_2.feature@ListWokrspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{id}}/clients
    And set value <values> of key name,adress in body agregarCliente.json
    When execute method POST
    Then the status code should be 201
    Examples:
      | values                         |
      | "pepito","direccion de pepito" |


  Scenario: Eliminar cliente de espacio de trabajo
    Given  call Clockify_2.feature@ListClients
    And base url https://api.clockify.me/api
    And endpoint /workspaces/{{id}}/clients/{{idClient}}
    When execute method DELETE
    Then the status code should be 200