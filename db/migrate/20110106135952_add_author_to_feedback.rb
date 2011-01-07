class AddAuthorToFeedback < ActiveRecord::Migration
  def self.up
    add_column :feedbacks, :author_id, :integer
  end

  def self.down
    remove_column :feedbacks, :author_id
  end
end
