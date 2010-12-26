@question
Feature: display tagged questions

  Background:
    Given I am a new, authenticated user
    And the following questions exist:
      | tag_list              | title                           |
      | ruby, rails           | getting started with ruby       |
      | ruby                  | programming in ruby, the basics |
      | ruby, rspec, cucumber | testing with ruby               |
      | ruby, rspec           | rspec2                          |
    And I am on the home page

  Scenario: list questions by tag
    Then I should see the following questions:
      | Title                           |
      | getting started with ruby       |
      | programming in ruby, the basics |
      | testing with ruby               |
      | rspec2                          |
    When I follow "rails"
    Then I should see the following questions:
      | Title                           |
      | getting started with ruby       |
    When I follow "rspec"
    Then I should see the following questions:
      | Title                           |
      | testing with ruby               |
      | rspec2                          |
    When I follow "ruby"
    Then I should see the following questions:
      | Title                           |
      | getting started with ruby       |
      | programming in ruby, the basics |
      | testing with ruby               |
      | rspec2                          |
