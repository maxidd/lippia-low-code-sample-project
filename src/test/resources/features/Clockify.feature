@Clockify
Feature: clockify

  Background:
    Given header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTRjZDAzMjQtNGQ1NS00OTY4LWFmODgtN2EwY2RkMzAxNGIx

  @ListWorkspace
  Scenario: Listar Espacios de Trabajo
    Given base url https://api.clockify.me/api
    Given endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define idWorkspace = $.[0].id

  @ListClients
  Scenario: Obtener Clientes de un Espacio de Trabajo
    Given call Clockify.feature@ListWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/clients
    When execute method GET
    Then the status code should be 200
    And the response array is empty

  @AddClientToWorkspace
  Scenario: Agregar Cliente a Espacio de Trabajo
    Given call Clockify.feature@ListWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/clients
    And body addClient.json
    When ejecutar metodo POST
    Then the status code should be 201
    And response should be name = newClient1
    * define idClient = $.id

  @DeleteClient @Execute
  Scenario: Eliminar Cliente del Espacio de Trabajo
    Given call Clockify.feature@AddClientToWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/clients/{{idClient}}
    When execute method DELETE
    Then the status code should be 200

  @Create_Workspace
  Scenario:
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    And set value "MyWorkspace" of key name in body addWorkspace.json
    When execute method POST
    Then the status code should be 201

    @CreateProject
    Scenario Outline: Crear un proyecto para un workspace especifico
      Given call Clockify.feature@ListWorkspace
      And base url env.base_url_clockify
      And endpoint /v1/workspaces/{{idWorkspace}}/projects
      And set value <name> of key name in body addProject.json
      When execute method POST
      Then the status code should be 201

      Examples:
      |name|
      |    |