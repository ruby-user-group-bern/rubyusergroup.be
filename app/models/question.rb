class Question < ActiveRecord::Base

  acts_as_taggable_on :tags

  belongs_to :author, :class_name => 'User'
  has_many :answers

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author

  scope :solved, where(:solved => true)
  scope :unsolved, where(:solved => false)

  after_initialize :mark_as_unsolved
  def mark_as_unsolved
    self.solved ||= false
  end

end
