class RemoveUkedagKlokkeslettFromExercises < ActiveRecord::Migration
  def up
    remove_column :exercises, :ukedag
        remove_column :exercises, :klokkeslett
      end

  def down
    add_column :exercises, :klokkeslett, :string
    add_column :exercises, :ukedag, :string
  end
end
