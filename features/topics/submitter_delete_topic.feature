Feature: remove an existing topic

  Background:
    Given I am a new, authenticated user
    And I have submitted a topic named "Ruby Best Practices"
  @wip
  Scenario: remove the topic
    When I go to the topics page
    And I follow "Löschen" in the "Ruby Best Practices" section
    Then I should see the flash notice "Thema wurde erfolgreich gelöscht."
    And I should not see "Ruby Best Practices"
