class AddViewsToLinks < ActiveRecord::Migration
  def change
  	change_table :links do |t|
  		t.integer :views, :default => 0
  	end
  	Link.update_all ["views = ?", 0]
  end
end
