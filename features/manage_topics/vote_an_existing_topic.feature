Feature: vote an existing topic

  Background:
    Given I am a new, authenticated user
    And a topic named "writing specs with RSpec" with 2 votes
    And I am on the home page

  Scenario: vote for a topic
    When I vote for the topic "writing specs with RSpec"
    Then I should see the flash notice "Votum wurde erfolgreich erstellt."
    And the topic "writing specs with RSpec" should have 3 votes

  Scenario: you can't vote on a topic, that you have already voted
    When I vote for the topic "writing specs with RSpec"
    Then I should not be able to vote for the topic "writing specs with RSpec"

  Scenario: you can't vote your own topics
    Given I am the submitter of the topic "writing specs with RSpec"
    # reload is needed
    And I am on the home page
    Then I should not be able to vote for the topic "writing specs with RSpec"
