class DropTableExercises < ActiveRecord::Migration
  def change
  	drop_table :exercises
  end
end
