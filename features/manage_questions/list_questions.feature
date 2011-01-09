Feature: list questions

  Background:
    Given I am a new, authenticated user

  Scenario: list open questions only
    Given the following questions exists:
      | title                           | solved |
      | What is ActiveRecord?           | true   |
      | What is Rails?                  | false  |
      | How can I open a file with vim? | false  |
    When I go to the questions page
    Then I should see "How can I open a file with vim?"
    And I should see "What is Rails?"
    And I should not see "What is ActiveRecord"

  Scenario: display link to show the full question content
    Given a question titled "You're Cuking It Wrong?" with content:
       """
       Opinions on cucumber seem to be divided in the Ruby community. Here at Elabs we’ve been using cucumber to
       fantastic success on all of our projects for more than a year. At the same time Steak and
       projects like it seem to be gaining traction; some people are seemingly frustrated and fed up with cucumber.
       """
    When I go to the questions page
    Then I should see the link "mehr" to display the full question content
