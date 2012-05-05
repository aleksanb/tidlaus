class AddDeliverytimeToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :deadline, :integer
  end
end
