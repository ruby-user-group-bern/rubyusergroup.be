lambda do
  variables = YAML.load_file(Rails.root + 'config' + 'variables.yml')
  JABBER_ID = ENV['GMAIL_LOGIN'] || variables['gmail']['login']
  JABBER_PASSWORD = ENV['GMAIL_PASSWORD'] || variables['gmail']['password']
end.call
