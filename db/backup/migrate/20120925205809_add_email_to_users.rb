class AddEmailToUsers < ActiveRecord::Migration
  def change
      change_table :users do |t|
          t.string :email
      end
      User.update_all ["email = ?",nil]
  end
end
