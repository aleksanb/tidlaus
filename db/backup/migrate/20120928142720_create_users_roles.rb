class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.references :user
      t.references :role
      t.timestamps
    end
  end
end
