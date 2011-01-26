Feature: update an existing question from a user

  Background:
    Given I am a new, authenticated admin
    And a question titled "It's my treasure" exist

  Scenario: edit existing question
    When I go to the questions page
    And I follow "Bearbeiten"
    And I fill in "Content" with "Sorry for the change"
    When I press "Frage ändern"
    Then I should see the flash notice "Frage wurde erfolgreich geändert."
    And I should see "Sorry for the change"
