Then /^I should see the flash (notice|alert) "([^"]+)"$/ do |kind, message|
  flash_messages[kind].should include(message)
end

Then /^I should not see the flash (notice|alert) "([^"]+)"$/ do |kind, message|
  if flash_messages.has_key? kind
    flash_messages[kind].should_not include(message)
  end
end
