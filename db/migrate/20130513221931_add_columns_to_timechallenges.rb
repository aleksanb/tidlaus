class AddColumnsToTimechallenges < ActiveRecord::Migration
  def change
    add_column :timechallenges, :reward, :string
    add_column :timechallenges, :deadline, :datetime
  end
end
