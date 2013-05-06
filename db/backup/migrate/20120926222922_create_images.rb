class CreateImages < ActiveRecord::Migration
  def change
  create_table :images do |t|
    t.string :title
    t.attachment :image
    t.text :description
    t.timestamps
  end
  end
end
