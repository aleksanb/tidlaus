class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.integer :user_id
      t.integer :timechallenge_id

      t.timestamps
    end
  end
end
