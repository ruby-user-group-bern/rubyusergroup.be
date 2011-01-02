class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :questions, :foreign_key => 'author_id'
  has_many :answers, :foreign_key => 'author_id'
  has_many :topics, :foreign_key => 'submitter_id'

  def to_s
    email.gsub(/@.+/, '')
  end

end
