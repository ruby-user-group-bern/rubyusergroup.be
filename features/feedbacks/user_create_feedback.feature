Feature: submit a feedback

  Background:
    Given I am a new, authenticated user
    And I am on the new feedback page

  @wip
  Scenario: write a feedback
    When I fill in "Title" with "IRC channel"
    And I fill in "Content" with "You guys should create an irc channel for..."
    And I press "Feedback senden"
    Then I should see the flash notice "Feedback wurde erfolgreich gesendet."
