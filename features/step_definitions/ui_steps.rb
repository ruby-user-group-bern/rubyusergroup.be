Then /^I should not see the sidebar$/ do
  page.should_not have_css('#sidebar')
end
