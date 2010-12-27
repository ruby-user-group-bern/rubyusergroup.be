Then /^I should see the following questions:$/ do |question_table|
  actual_questions = all('#questions .question').map do |question|
    {
      'Title' => question.find('h2').plain_text
    }
  end
  question_table.diff! actual_questions
end

Given /^the user "([^"]*)" has an existing question titled "([^"]*)"$/ do |email, title|
  user = User.find_by_email(email)
  Factory.create(:question, :title => title, :author => user)
end
