@question
Feature: submit a question

  Background:
    Given I am a new, authenticated user

  Scenario: add a question
    Given I am on the home page
    When I follow "Neue Frage"
    And I fill in "Titel" with "What is Ruby?"
    And I fill in "Content" with "I'm looking for an outline of Ruby"
    And I press "Frage hinzufügen"
    Then I should see the flash notice "Frage wurde erfolgreich erstellt."
    And I should see "What is Ruby?"
