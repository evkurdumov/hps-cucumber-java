@sprint-3
Feature: Support internationalisation
    "**In order to** practice my use of greetings in several languages"
    "**As a** polyglot coffee lover"
    "**I can** select the language on the coffee machine"

  @priority-medium
  Scenario Outline: Messages are based on language (<hiptest-uid>)
    When I start the coffee machine using language "<language>"
    Then message "<ready_message>" should be displayed

    Examples:
      | language | ready_message | hiptest-uid |
      | en | Ready | uid:ee82728d-016c-44b4-8099-872c42a415b0 |
      | fr | Pret | uid:46a6523b-ed6f-4c34-a73d-3d7b6e5553e9 |

  @priority-medium
  Scenario: No messages are displayed when machine is shut down (uid:b48f79a9-d91f-425c-9525-36890c1394ea)
    Given the coffee machine is started
    When I shutdown the coffee machine
    Then message "" should be displayed
