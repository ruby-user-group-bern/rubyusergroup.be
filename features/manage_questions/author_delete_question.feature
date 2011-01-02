Feature: delete an existing question

  Background:
    Given I am a new, authenticated user
    And I have a question titled "How can I learn Git?"

  Scenario: delete existing question from the detail page
    When I go to that questions page
    And I follow "Löschen"
    Then I should see the flash notice "Frage wurde erfolgreich gelöscht."
    And I should have no question titled "How can I learn Git?"

  Scenario: delete an existing question from the index page
    When I go to the questions page
    And I follow "Löschen" in the "How can I learn Git?" section
    Then I should see the flash notice "Frage wurde erfolgreich gelöscht."
    And I should have no question titled "How can I learn Git?"
