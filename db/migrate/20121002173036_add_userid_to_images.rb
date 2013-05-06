class AddUseridToImages < ActiveRecord::Migration
  def change
  	change_table :images do |t|
  		t.integer :user_id
  	end
  	Image.destroy_all
  end
end
