class RemoveDescriptionNumberDato < ActiveRecord::Migration
  def up
  	remove_column :exercises, :description 
  	remove_column :exercises, :number
  	remove_column :exercises, :dato
  	add_column :exercises, :date, :datetime
  end

  def down
  end
end
