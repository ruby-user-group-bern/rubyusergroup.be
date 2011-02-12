Feature: Remove an existing Answer

  Background:
    Given I am a new, authenticated user
    And a question titled "How old are you?"
    And the question "How old are you?" has the following answers:
      | Author         | Answer                 |
      | <me>           | My name is Urs Meier   |

  Scenario: remove your own reply
    Given I am on the question "How old are you?" page
    Then I should see "My name is Urs Meier"
    When I follow "Löschen"
    Then I should see the flash notice "Antwort wurde erfolgreich gelöscht."
    And I should be on the question "How old are you?" page
    And I should not see "My name is Urs Meier"

