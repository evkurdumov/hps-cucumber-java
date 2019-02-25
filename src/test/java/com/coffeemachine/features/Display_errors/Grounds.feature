Feature: Grounds
    As a coffee lover
    I have to empty the grounds
    So I don't end up with a total mess around the coffee machine

  Background:
    Given the coffee machine is started
    And I handle everything except the grounds

  @priority-high
  Scenario: Message "Empty grounds" is displayed after 30 coffees are taken (uid:a7e8ed1e-d612-49a8-9509-277748385988)
    When I take "30" coffees
    Then message "Empty grounds" should be displayed

  @priority-medium
  Scenario: When the grounds are emptied, message is removed (uid:1bd9560f-7c62-461e-a613-91ed0720217e)
    When I take "30" coffees
    And I empty the coffee grounds
    Then message "Ready" should be displayed
