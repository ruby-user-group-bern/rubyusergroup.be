Feature: list questions

  Background:
    Given I am a new, authenticated user

  Scenario: list open questions only
    Given the following questions exists:
      | title                           | solved |
      | What is ActiveRecord?           | true   |
      | What is Rails?                  | false  |
      | How can I open a file with vim? | false  |
    When I go to the home page
    Then I should see "How can I open a file with vim?"
    And I should see "What is Rails?"
    And I should not see "What is ActiveRecord"
