class AddForeignKeyToAttendings < ActiveRecord::Migration
  def change
    add_column :attendings, :status_id, :integer
  end
end
