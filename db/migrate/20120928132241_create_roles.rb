class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.column :title, :string
      t.references :user
      t.timestamps
    end
  end
end
