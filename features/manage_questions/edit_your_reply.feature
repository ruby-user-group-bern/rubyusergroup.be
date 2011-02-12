Feature: edit your reply to a question

  Background:
    Given I am a new, authenticated user
    And a question titled "How old are you?"
    And the question "How old are you?" has the following answers:
      | Author         | Answer                 |
      | <me>           | My name is Peter Meter |
      | bernie@gmx.net | I am Bernadett Meister |

  @wip
  Scenario: edit your own reply
    Given I am on the question "How old are you?" page
    When I follow "Bearbeiten"
    Then I should be on the answer "My name is Peter Metter" page
    When I fill in "answer_content" with "My name is Peter Meter"
    And I press "Speichern"
    Then I should see the flash notice "PETER"
    And I should be on the question "How old are you?" page
    And I should see "My name is Peter Meter"

