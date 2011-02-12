source 'http://rubygems.org'

gem 'rails'
gem 'devise'
gem 'cancan'
gem "will_paginate", "~> 3.0.pre2"
gem 'xmpp4r'

# Controllers
gem 'inherited_resources'
gem 'has_scope'
gem 'responders'

# Models
gem 'acts-as-taggable-on'

# Views
gem 'haml'
gem 'simple_form'
gem 'rdiscount'
gem 'coderay'

group :production do
  gem 'mysql2'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'factory_girl_rails'

  # Database
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'shoulda'
  gem 'forgery'
  gem 'fuubar'
  gem 'fuubar-cucumber'
  gem 'infinity_test'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'backyard'
  gem 'email_spec'
end
