class Question < ActiveRecord::Base

  acts_as_taggable_on :tags

  belongs_to :author, :class_name => 'User'
  has_many :answers

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author

  scope :solved, where(:solved => true).order("created_at DESC")
  scope :unsolved, where(:solved => false).order("created_at DESC")

  after_initialize :mark_as_unsolved
  def mark_as_unsolved
    self.solved ||= false
  end

  include Rugb::Jabber

  notify :after_create, :jabber_text

  def to_s
    title
  end

  def jabber_text
    "Frage von #{author}:\n\n#{title}\n#{content}"
  end

  def email_subject
    "#{self}, von #{author}"
  end

  after_create :send_email

  def send_email
    User.notified_by_email.each do |user|
      NotificationMailer.new_question_email(self, user).deliver
    end
  end

end
