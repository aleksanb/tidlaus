class AddHtmlSafeToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :html_safe, :boolean
  end
end
