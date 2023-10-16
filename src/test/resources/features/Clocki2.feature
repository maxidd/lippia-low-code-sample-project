@clocki
Feature:


  @Agregar_Cliente_a_Workspace
  Scenario:
    Given call Clocki2.feature@Listar_espacios_de_trabajo
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/clients
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTRjZDAzMjQtNGQ1NS00OTY4LWFmODgtN2EwY2RkMzAxNGIx
    And body addClient.json
    When ejecutar metodo POST
    Then the status code should be 201

  @Listar_espacios_de_trabajo
  Scenario:
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTRjZDAzMjQtNGQ1NS00OTY4LWFmODgtN2EwY2RkMzAxNGIx
    When execute method GET
    Then the status code should be 200
    * define idWorkspace = $.[0].id

