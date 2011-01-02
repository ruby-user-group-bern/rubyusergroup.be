Then /^I should see the following questions:$/ do |question_table|
  actual_questions = all('#questions .question').map do |question|
    {
      'Title' => question.find('h2').plain_text
    }
  end
  question_table.diff! actual_questions
end

Given /^I have a question titled "([^"]*)"$/ do |question_title|
  raise "you need to be logged in to have questions" unless @user
  @question = Factory.create(:question, :title => question_title, :author => @user)
end

Then /^I should have no question titled "([^"]*)"$/ do |title|
  @user.questions.where(:title => title).should be_blank
end
