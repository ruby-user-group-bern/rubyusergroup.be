Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  @user = User.new(:email => email,
                   :login => login,
                   :password => password,
                   :password_confirmation => password)
  @user.save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  login = 'Testing man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  When %{I sign in with "#{email}" and password "#{password}"}
end

Given /^I am a new, authenticated admin$/ do
  @user = Factory(:admin)
  When %{I sign in with "#{@user.email}" and password "#{@user.password}"}
end

When /^I log out$/ do
  visit('/users/sign_out')
end

When /^I sign in with "([^"]*)" and password "([^"]*)"$/ do |email, password|
  And %{I go to the login page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Anmelden"}
end

Then /^I should be logged in$/ do
  And %{I should see "Abmelden"}
end

Then /^I should not be logged in$/ do
  And %{I should not see "Abmelden"}
end

Then /^I should be able to log in with "([^"]*)" and password "([^"]*)"$/ do |email, password|
  When %{I sign in with "#{email}" and password "#{password}"}
  Then %{I should be logged in}
end

Then /^I should not be able to log in with "([^"]*)" and password "([^"]*)"$/ do |email, password|
  When %{I sign in with "#{email}" and password "#{password}"}
  Then %{I should not be logged in}
end
