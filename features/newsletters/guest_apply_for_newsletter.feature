Feature: guest user register for newsletter

  Scenario: guest user subscribe for newsletter
    When I go to the home page
    And I write my "fan@gmail.com" in the newsletter field
    And I press "Abonnieren"
    Then I should see "Danke für das abonnieren unseres Newsletters"
