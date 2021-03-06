Feature: vote an existing topic

  Background:
    Given I am a new, authenticated user
    And a topic named "writing specs with RSpec" with 2 votes
    And I am on the questions page

  Scenario: vote for a topic in the sidebar
    When I vote for the topic "writing specs with RSpec"
    Then I should see the flash notice "Votum wurde erfolgreich erstellt."
    And the topic "writing specs with RSpec" should have 3 votes

  Scenario: vote for a topic on the topics page
    When I follow "Themen"
    And I follow "+1" in the "writing specs with RSpec" section
    Then I should see the flash notice "Votum wurde erfolgreich erstellt."
    And the topic "writing specs with RSpec" should have 3 votes

  Scenario: you can't vote on a topic, that you have already voted
    When I vote for the topic "writing specs with RSpec"
    Then I should not be able to vote for the topic "writing specs with RSpec"

  Scenario: you can't vote your own topics
    Given I am the submitter of the topic "writing specs with RSpec"
    # reload is needed
    And I am on the questions page
    Then I should not be able to vote for the topic "writing specs with RSpec"
