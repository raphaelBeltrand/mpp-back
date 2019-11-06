class AddAdminToGroupUser < ActiveRecord::Migration[6.0]
  def change
    add_column :group_users, :is_admin, :boolean, default: false
  end
end
