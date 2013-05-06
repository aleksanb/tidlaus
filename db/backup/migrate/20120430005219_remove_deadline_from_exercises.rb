class RemoveDeadlineFromExercises < ActiveRecord::Migration
  def up
    remove_column :exercises, :deadline
      end

  def down
    add_column :exercises, :deadline, :string
  end
end
