Feature: list topics

  Background:
    Given I am a new, authenticated user
    And the following topics exist:
      | Title      |
      | My Topic 1 |
      | My Topic 2 |
      | My Topic 3 |
      | My Topic 4 |
      | My Topic 5 |
      | My Topic 6 |
      | My Topic 7 |
    And I am on the home page

  Scenario: list the five most recent topics
    Then I should see the following topics:
      | My Topic 7 |
      | My Topic 6 |
      | My Topic 5 |
      | My Topic 4 |
      | My Topic 3 |
