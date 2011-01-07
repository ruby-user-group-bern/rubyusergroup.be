class Feedback < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author

end
