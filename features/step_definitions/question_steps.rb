Then /^I should see the following questions:$/ do |question_table|
  actual_questions = all('#questions .question').map do |question|
    {
      'Title' => question.find('h4').plain_text
    }
  end
  question_table.diff! actual_questions
end

Given /^I have a question titled "([^"]*)"$/ do |question_title|
  raise "you need to be logged in to have questions" unless @user
  @question = Factory.create(:question, :title => question_title, :author => @user)
end

Given /^a question titled "([^"]*)" with content:$/ do |question_title, question_content|
  raise "you need to be logged in to have questions" unless @user
  @question = Factory.create(:question, :title => question_title,
                             :content => question_content,
                             :author => @user)
end

Then /^I should have no question titled "([^"]*)"$/ do |title|
  @user.questions.where(:title => title).should be_blank
end

When /^I should see the link "([^"]*)" to display the full question content$/ do |name|
  page.should have_link(name)
end

When /^I should not see the link "([^"]*)" to display the full question content$/ do |name|
  page.should have_no_link(name)
end

Given /^a question titled "([^"]*)" exist$/ do |content|
  raise "you need to be logged in to have questions" unless @user
  @question = Factory.create(:question, :title => content)
end
