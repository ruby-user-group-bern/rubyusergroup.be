class AddReceiveJabberNotificationsFlagToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :receive_jabber_notifications, :boolean
  end

  def self.down
    remove_column :users, :receive_jabber_notifications
  end
end
