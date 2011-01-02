Feature: submit a topic

  Background:
    Given I am a new, authenticated user
    And I am on the home page

  Scenario: add a topic from the questions page
    When I add a topic called "Cucumber organization"
    Then I should see the flash notice "Thema wurde erfolgreich erstellt."
    And I should be on the home page
    And I should see the topic "Cucumber organization"

  Scenario: add a topic from the topics page
    When I follow "Themen"
    And I add a topic called "Cucumber Best Practices"
    Then I should see the flash notice "Thema wurde erfolgreich erstellt."
    And I should be on the topics page
    And I should see the topic "Cucumber Best Practices"

   Scenario: can't submit an empty topic
    When I press "Thema hinzufügen"
    Then I should see the flash alert "Titel muss ausgefüllt werden"
    And I should not see the topic ""
    And I should be on the home page
