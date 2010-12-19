Factory.define :user do |f|
  f.email { Forgery::Internet.email_address }
  f.password { 'secret' }
  f.password_confirmation { 'secret' }
end
