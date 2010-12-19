@authentication
Feature: sign in

  Background:
    Given I have one user "valid@rugb.ch" with password "secret" and login "valid"
    And I am on the login page

  Scenario: sign in with existing user
    And I fill in "E-Mail" with "valid@rugb.ch"
    And I fill in "Passwort" with "secret"
    And I press "Anmelden"
    Then I should see the flash notice "Angemeldet."
    And I should be logged in

  Scenario: can't sign in with non-existing user
    And I fill in "E-Mail" with "invalid@rugb.ch"
    And I fill in "Passwort" with "secret"
    And I press "Anmelden"
    Then I should see the flash alert "Ungültige E-Mail-Adresse oder Passwort."
    And I should not be logged in

  Scenario: can't sign in with wrong password
    And I fill in "E-Mail" with "valid@rugb.ch"
    And I fill in "Passwort" with "wrong"
    And I press "Anmelden"
    Then I should see the flash alert "Ungültige E-Mail-Adresse oder Passwort."
    And I should not be logged in
