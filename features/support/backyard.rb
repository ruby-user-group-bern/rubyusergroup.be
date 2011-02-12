require 'backyard/cucumber'

Backyard.configure do
  name_attribute :email, :for => :user
  name_attribute :title, :for => :question
  name_attribute :content, :for => :answer
end
