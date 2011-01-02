lambda do
  variables = YAML.load_file(Rails.root + 'config' + 'variables.yml')
  JABBER_ID = ENV['JABBER_ID'] || variables['jabber']['jid']
  JABBER_PASSWORD = ENV['JABBER_PASSWORD'] || variables['jabber']['password']
end.call
