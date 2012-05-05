class AddDatoToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :dato, :Time
  end
end
