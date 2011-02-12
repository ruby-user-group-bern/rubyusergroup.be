Feature: submit a reply to a question

  Background:
    Given I am a new, authenticated user
    And the following question:
      | Title              | Author               |
      | What is your name? | detective@police.com |
    And the question "What is your name?" has the following answers:
      | Author         |
      | werner@rack.de |

  Scenario: add a reply to an existing question
    Given the following users:
      | E-Mail            |
      | rubyist@rails.com |
      | apple@me.com      |
    Given I am on the questions page
    And no emails have been sent
    When I follow "What is your name?"
    And I fill in "answer_content" with "Hans Peter"
    And I press "Antworten"
    Then I should see the flash notice "Antwort wurde erfolgreich erstellt."
    And "detective@police.com" should receive an email
    And "werner@rack.de" should receive an email
    And "rubyist@rails.com" should receive no email
    And "apple@me.com" should receive no email
    And I should see "What is your name?"
    And I should see "Hans Peter"
