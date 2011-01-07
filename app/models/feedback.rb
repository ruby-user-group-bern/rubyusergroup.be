class Feedback < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author

  after_create :send_email

  def send_email
    NotificationMailer.new_feedback_email(self).deliver
  end
end
