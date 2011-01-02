class Topic < ActiveRecord::Base

  belongs_to :submitter, :class_name => 'User'
  has_many :votes

  validates_presence_of :title
  validates_presence_of :submitter

  scope :ordered, order('created_at DESC')
  scope :top_5, limit(5).ordered

  def voted_by?(user)
    votes.where(:voter_id => user.id).exists?
  end

  def to_s
    title
  end

end
