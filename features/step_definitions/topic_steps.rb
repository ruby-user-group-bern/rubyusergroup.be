# -*- coding: utf-8 -*-
Given /^a topic named "([^"]*)" with (\d+) votes$/ do |topic, vote_count|
  topic = Factory(:topic, :title => topic)
  vote_count.to_i.times do
    Factory(:vote, :topic => topic)
  end
end

Given /^I am the submitter of the topic "([^"]*)"$/ do |topic_title|
  topic = Topic.find_by_title(topic_title)
  topic.submitter = @user
  topic.save
end

When /^I vote for the topic "([^"]*)"$/ do |topic|
  get_topics[topic].add_vote.should be_true
end

When /I add a topic called "([^"]*)"/ do |topic|
  fill_in 'Titel', :with => topic
  When %{I press "Thema hinzufügen"}
end

Then /^I should see the topic "([^"]*)"$/ do |topic|
  get_topics.keys.should include(topic)
end

Then /^I should not see the topic "([^"]*)"$/ do |topic|
  get_topics.keys.should_not include(topic)
end

Then /^the topic "([^"]*)" should have (\d+) votes$/ do |topic, vote_count|
  get_topics[topic][:votes].should == vote_count
end

Then /^I should not be able to vote for the topic "([^"]*)"$/ do |topic|
  get_topics[topic].add_vote.should be_false
end

Then /^I should see the following topics:$/ do |topic_table|
  get_topics.keys.should == topic_table.raw.flatten
end
