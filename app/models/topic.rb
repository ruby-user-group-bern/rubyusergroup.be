class Topic < ActiveRecord::Base

  belongs_to :submitter, :class_name => 'User'
  has_many :votes

  validates_presence_of :title
  validates_presence_of :submitter

  def voted_by?(user)
    votes.where(:voter_id => user.id).exists?
  end

end
