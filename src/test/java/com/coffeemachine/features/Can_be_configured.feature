@sprint-2
Feature: Can be configured
    "**In order to** get the best possible coffees"
    "**As a** geeky coffee lover"
    "**I can** configure it to match my needs"

  @priority-medium
  Scenario: Display settings (uid:723b9623-48f0-4a10-90f5-4128fbdade5d)
    Given the coffee machine is started
    When I switch to settings mode
    Then displayed message is:
      """
      Settings:
       - 1: water hardness
       - 2: grinder
      """

  @priority-high
  Scenario: Default settings (uid:e5f2bd09-af77-4222-bbe9-900b42a59d75)
    Given the coffee machine is started
    When I switch to settings mode
    Then settings should be:
      | water hardness | 2      |
      | grinder        | medium |
