Feature: display tagged questions

  Background:
    Given I am a new, authenticated user
    And the following questions exist:
      | tag_list              | title                           |
      | ruby, rails           | getting started with ruby       |
      | ruby                  | programming in ruby, the basics |
      | ruby, rspec, cucumber | testing with ruby               |
      | ruby, rspec           | rspec2                          |
    And I am on the questions page

  Scenario: list questions by tag
    Then I should see the following questions:
      | Title                           |
      | rspec2                          |
      | testing with ruby               |
      | programming in ruby, the basics |
      | getting started with ruby       |
    When I follow "rails"
    Then I should see the following questions:
      | Title                           |
      | getting started with ruby       |
    When I follow "rspec"
    Then I should see the following questions:
      | Title                           |
      | rspec2                          |
      | testing with ruby               |
    When I follow "ruby"
    Then I should see the following questions:
      | Title                           |
      | rspec2                          |
      | testing with ruby               |
      | programming in ruby, the basics |
      | getting started with ruby       |
