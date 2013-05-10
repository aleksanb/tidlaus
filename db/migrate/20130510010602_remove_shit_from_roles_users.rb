class RemoveShitFromRolesUsers < ActiveRecord::Migration
  def change
    remove_column :roles_users, :created_at, :datetime
    remove_column :roles_users, :updated_at, :datetime
  end
end
