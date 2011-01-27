When /^I write my "([^"]*)" in the newsletter field$/ do |email|
  fill_in "newsletter_email", :with => email
end
