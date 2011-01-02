class Answer < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'
  belongs_to :question

  validates_presence_of :author
  validates_presence_of :question
  validates_presence_of :content


  include Rugb::Jabber

  notify :after_create, :jabber_text

  def jabber_text
    "Antwort auf die Frage '#{question.title}':\n\n#{author} sagt:\n#{content}"
  end

end
