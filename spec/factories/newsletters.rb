Factory.define :newsletter do |f|
  f.email { Forgery::Internet.email_address }
end
