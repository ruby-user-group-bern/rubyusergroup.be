Feature: submit a question

  Background:
    Given I am a new, authenticated user
    And I am on the home page
    When I follow "Neue Frage"

  Scenario: add a question
    When I fill in "Titel" with "What is Ruby?"
    And I fill in "Content" with "I'm looking for an outline of Ruby"
    And I press "Frage hinzufügen"
    Then I should see the flash notice "Frage wurde erfolgreich erstellt."
    And I should see "What is Ruby?"

  Scenario: allow the user to post embedded gists
    When I fill in "Titel" with "Question with a gist"
    And I fill in "Content" with:
      """
      <script src="https://gist.github.com/736331.js?file=gistfile1.sh"></script>
      """
    And I press "Frage hinzufügen"
    Then I should see the flash notice "Frage wurde erfolgreich erstellt."
    And I should see "Question with a gist"
    And I should not see:
      """
      <script src="https://gist.github.com/736331.js?file=gistfile1.sh"></script>
      """
