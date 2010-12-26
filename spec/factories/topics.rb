Factory.define :topic do |f|
  f.title { Forgery::LoremIpsum.sentence }
  f.association :submitter, :factory => :user
end
