Feature: Water
    As a coffee lover
    I have to handle the water tank
    So I can have coffee when I need it

  Background:
    Given the coffee machine is started
    And I handle everything except the water tank

  @priority-high
  Scenario: Message "Fill water tank" is displayed after 50 coffees are taken (uid:93709c67-e66b-486d-a01f-ce19c3bb83fa)
    When I take "50" coffees
    Then message "Fill tank" should be displayed

  @priority-low
  Scenario: It is possible to take 10 coffees after the message "Fill water tank" is displayed (uid:f8e866f0-390c-4d7a-8504-7414e968fe4d)
    When I take "60" coffees
    Then coffee should be served
    When I take a coffee
    Then coffee should not be served

  @priority-high
  Scenario: When the water tank is filled, the message disappears (uid:30c571c6-83cb-4f58-9b77-32b8771597c1)
    When I take "55" coffees
    And I fill the water tank
    Then message "Ready" should be displayed
