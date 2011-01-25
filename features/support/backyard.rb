require 'backyard/cucumber'

Backyard.configure do
  name_attribute :email, :for => :user
end
