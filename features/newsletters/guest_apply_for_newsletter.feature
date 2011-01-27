Feature: guest user register for newsletter

  @wip
  Scenario: guest user deposit his email
    When I go to the home page
    And I write my email in the newsletter field
    And I press "register"
    Then I should see "Danke für das abonnieren unseres Newsletters".
