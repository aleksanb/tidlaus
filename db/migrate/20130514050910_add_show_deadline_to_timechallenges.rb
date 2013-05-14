class AddShowDeadlineToTimechallenges < ActiveRecord::Migration
  def change
    add_column :timechallenges, :show_deadline, :datetime
  end
end
