Factory.define :user do |f|
  f.email { Forgery::Internet.email_address }
  f.password { 'secret' }
  f.password_confirmation { 'secret' }
  f.receive_email_notifications { true }
  f.receive_jabber_notifications { false }
end
