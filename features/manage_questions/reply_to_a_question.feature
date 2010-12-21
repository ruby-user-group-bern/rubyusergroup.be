@question @answer
Feature: submit a reply to a question

  Background:
    Given I am a new, authenticated user
    And a question exists with a title of "What is your name?"

  Scenario: add a reply to an existing question
    Given I am on the home page
    When I follow "What is your name?"
    And I fill in "Antwort" with "Hans Peter"
    And I press "Antworten"
    Then I should see the flash notice "Antwort wurde erfolgreich erstellt."
    And I should see "What is your name?"
    And I should see "Hans Peter"
