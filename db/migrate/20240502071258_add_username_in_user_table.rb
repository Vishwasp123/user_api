class AddUsernameInUserTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_name, :strings
  end
end
