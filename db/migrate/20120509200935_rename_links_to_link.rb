class RenameLinksToLink < ActiveRecord::Migration
  def up
  	rename_table :links, :link
  end

  def down
  end
end
