class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :github_username, :receive_jabber_notifications, :receive_email_notifications

  has_many :questions, :foreign_key => 'author_id'
  has_many :answers, :foreign_key => 'author_id'
  has_many :topics, :foreign_key => 'submitter_id'
  has_many :feedbacks, :foreign_key => 'author_id'

  scope :notified_by_jabber, where(:receive_jabber_notifications => true)
  scope :notified_by_email, where(:receive_email_notifications => true)
  scope :ordered, order('id asc')

  def to_s
    self[:github_username].present? ? self[:github_username] : email.gsub(/@.+/, '')
  end

end
