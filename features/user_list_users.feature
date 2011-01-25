Feature: list usergroup users

  Background:
    Given I am a new, authenticated user
    And the following users:
      | ID | Username    |
      |  8 | peter.meter |
      |  9 | hans.lustig |
      |  7  | john.doe    |
    And I am on the home page

  Scenario: list users
    When I follow "Mitglieder"
    Then I should see the following users:
      | Username    |
      | testing     |
      | john.doe    |
      | peter.meter |
      | hans.lustig |
