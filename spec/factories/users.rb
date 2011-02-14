Factory.define :user do |f|
  f.email { Forgery::Internet.email_address }
  f.password { 'secret' }
  f.password_confirmation { 'secret' }
  f.receive_email_notifications { false }
  f.receive_jabber_notifications { false }
end

Factory.define :admin, :parent => :user do |f|
  f.admin { true }
end
