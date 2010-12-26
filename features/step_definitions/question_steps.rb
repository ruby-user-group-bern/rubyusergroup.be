Then /^I should see the following questions:$/ do |question_table|
  actual_questions = all('#questions .question').map do |question|
    {
      'Title' => question.find('h2 a').plain_text
    }
  end
  question_table.diff! actual_questions
end
