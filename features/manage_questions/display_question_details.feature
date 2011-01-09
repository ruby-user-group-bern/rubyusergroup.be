Feature: show all details about a question

  Background:
    Given I am a new, authenticated user
    And a question titled "You're Cuking It Wrong?" with content:
       """
       Opinions on cucumber seem to be divided in the Ruby community. Here at Elabs we’ve been using cucumber to
       fantastic success on all of our projects for more than a year. At the same time Steak and
       projects like it seem to be gaining traction; some people are seemingly frustrated and fed up with cucumber.
       """

  Scenario: not display link to show the full question content
    When I go to the questions page
    And I follow "You're Cuking It Wrong?"
    Then I should not see the link "mehr" to display the full question content



