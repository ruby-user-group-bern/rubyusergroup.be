Feature: Sign Up

  Background:
    Given I am on the login page
    When I follow "Registrieren"

  Scenario: register a new user
    When I fill in "E-Mail" with "peter@meter.ch"
    And I fill in "Passwort" with "top_secret"
    And I fill in "Passwort bestätigen" with "top_secret"
    And I press "Registrieren"
    Then I should see the flash notice "Du hast dich erfolgreich registriert."
    And I should be logged in
    When I log out
    Then I should be able to log in with "peter@meter.ch" and password "top_secret"
