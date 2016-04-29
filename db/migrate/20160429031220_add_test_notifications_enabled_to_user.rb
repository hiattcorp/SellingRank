class AddTestNotificationsEnabledToUser < ActiveRecord::Migration
  def change
    add_column :users, :test_notifications_enabled, :boolean, default: true
  end
end
