Feature: mark an existing question as solved

  Background:
    Given I am a new, authenticated user
    And I have a question titled "Am I cucuking it right?"
    And I am on that questions page

  Scenario: edit my existing question
    When I follow "Als gelöst markieren"
    Then I should see the flash notice "Frage wurde erfolgreich geändert."
    And I should not see "Als gelöst markieren"
    And I should see "Als ungelöst markieren"
