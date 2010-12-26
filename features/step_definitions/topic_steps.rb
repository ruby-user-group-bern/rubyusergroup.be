# -*- coding: utf-8 -*-
When /I add a topic called "([^"]*)"/ do |topic|
  fill_in 'Titel', :with => topic
  When %{I press "Thema hinzufügen"}
end

Then /^I should see the topic "([^"]*)"$/ do |topic|
  all('.topics li').map(&:plain_text).should include(topic)
end

Then /^I should not see the topic "([^"]*)"$/ do |topic|
  all('.topics li').map(&:plain_text).should_not include(topic)
end
