@topic
Feature: submit a topic

  Background:
    Given I am a new, authenticated user
    And I am on the home page

  @wip
  Scenario: add a question
    When I fill in "Thema" with "Cucumber organization"
    And I press "Thema hinzufügen"
    Then I should see the flash notice "Pet"
    And I should see the topic "Cucumber organization"

  Scenario: can't submit an empty topic
    When I press "Thema hinzufügen"
    Then I should see the flash alert "Pet"
    And I should not see the topic ""
