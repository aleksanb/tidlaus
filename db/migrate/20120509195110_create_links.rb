class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :shorturl
      t.string :longurl

      t.timestamps
    end
  end
end
