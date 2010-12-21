Factory.define :answer do |f|
  f.content { Forgery::LoremIpsum.paragraphs }
  f.association :author, :factory => :user
  f.association :question
end
