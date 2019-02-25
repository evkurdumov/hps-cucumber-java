@sprint-1
Feature: Serve coffee
    "**In order to** enjoy the rest of the day"
    "**As a** coffee lover"
    "**I can** get coffee from the machine"

  @priority-high
  Scenario: Simple use (uid:149c3265-87fd-4b57-b2a9-48e6e24511cd)
    Well, sometimes, you just get a coffee.
    Given the coffee machine is started
    When I take a coffee
    Then coffee should be served
