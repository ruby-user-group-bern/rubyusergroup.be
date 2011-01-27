class Newsletter < ActiveRecord::Base

  validates_presence_of :email
  validates_uniqueness_of :email

  after_create :send_email

  def send_email
    NotificationMailer.new_newsletter_email(self).deliver
  end

end
