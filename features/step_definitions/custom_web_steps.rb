When /^I fill in "([^"]*)" with:$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I should not see:$/ do |text|
  page.should have_no_content(text)
end
