class AddGithubUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :github_username, :string
  end

  def self.down
    remove_column :users, :github_username, :string
  end
end
