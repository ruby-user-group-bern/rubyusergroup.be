Feature: edit a exisiting question

  Background:
    Given I am a new, authenticated user
    And I have a question titled "Where is my car?"

  Scenario: edit own question from the detail page
    When I go to that questions page
    And I follow "Bearbeiten"
    And I fill in "Content" with "Who got it?"
    And I press "Frage ändern"
    Then I should see the flash notice "Frage wurde erfolgreich geändert."
    And I should see "Where is my car?"
    And I should see "Who got it?"
