Factory.define :vote do |f|
  f.association :topic
  f.association :voter, :factory => :user
end
