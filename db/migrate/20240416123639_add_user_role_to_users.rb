class AddUserRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_role, :integer, default: 1
  end
end
