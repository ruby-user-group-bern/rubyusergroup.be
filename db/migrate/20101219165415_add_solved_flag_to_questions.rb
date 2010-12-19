class AddSolvedFlagToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :solved, :boolean
  end

  def self.down
    remove_column :questions, :solved
  end
end
