class AddAntallToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :antall, :int
  end
end
