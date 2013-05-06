class AddStuffToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :levert, :boolean
    add_column :exercises, :ferdig, :boolean
    add_column :exercises, :ukedag, :integer
    add_column :exercises, :klokkeslett, :integer
  end
end
