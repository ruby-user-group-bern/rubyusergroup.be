Factory.define :feedback do |f|
  f.title { Forgery::LoremIpsum.sentence }
  f.content { Forgery::LoremIpsum.paragraphs }
  f.association :author, :factory => :user
end
