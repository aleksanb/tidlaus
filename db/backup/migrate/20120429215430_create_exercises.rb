class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :meta
      t.integer :number

      t.timestamps
    end
  end
end
