class StringToTextForArticle < ActiveRecord::Migration
  def change
  	remove_column :articles, :content
  	add_column :articles, :content, :text
  end
end
