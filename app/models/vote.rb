class Vote < ActiveRecord::Base

  belongs_to :topic
  belongs_to :voter, :class_name => 'User'

  validates_presence_of :topic
  validates_presence_of :voter

end
