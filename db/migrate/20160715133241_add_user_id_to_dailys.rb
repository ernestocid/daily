class AddUserIdToDailys < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_entries, :user_id, :integer
  end
end
