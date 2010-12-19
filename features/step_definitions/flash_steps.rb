Then /^I should see the flash notice "([^"]+)"$/ do |message|
  flash_messages['notice'].should include(message)
end
