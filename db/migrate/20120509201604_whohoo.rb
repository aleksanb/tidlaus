class Whohoo < ActiveRecord::Migration
  def up
  	rename_table :link, :links
  end

  def down
  end
end