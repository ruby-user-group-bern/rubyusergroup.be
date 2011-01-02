Feature: list usergroup users

  Background:
    Given I am a new, authenticated user
    And the following users exist:
      | email                 |
      | peter.meter@gmail.com |
      | hans.lustig@gmx.ch    |
      | john.doe@hotmail.com  |
    And I am on the home page

  Scenario: list users
    When I follow "Mitglieder"
    Then I should see "peter.meter"
    And I should see "hans.lustig"
    And I should see "john.doe"
