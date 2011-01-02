Feature: Homepage

  Scenario: guest users should see the login page
    When I go to the home page
    Then I should be on the login page

  Scenario: guest users should not see the sidebar
    When I go to the home page
    Then I should not see the sidebar
