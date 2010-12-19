class AddAuthorToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :author_id, :integer
  end

  def self.down
    remove_column :questions, :author_id
  end
end
