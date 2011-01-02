Feature: edit a exisiting question

  Background:
    Given I have one user "valid@rugb.ch" with password "secret" and login "valid"
    And I sign in with "valid@rugb.ch" and password "secret"

  Scenario: edit my existing question
    Given the user "valid@rugb.ch" has an existing question titled "Where is my car?"
    And I am on the home page
    When I follow "Where is my car?"
    And I follow "Bearbeiten"
    And I fill in "Content" with "Who got it?"
    And I press "Frage ändern"
    Then I should see the flash notice "Frage wurde erfolgreich geändert."
    And I should see "Where is my car?"
    And I should see "Who got it?"
