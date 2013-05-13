class CreateTimechallenges < ActiveRecord::Migration
  def change
    create_table :timechallenges do |t|
      t.string :title
      t.timestamps
    end
  end
end
