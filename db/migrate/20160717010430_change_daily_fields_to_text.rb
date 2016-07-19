class ChangeDailyFieldsToText < ActiveRecord::Migration[5.0]
  def up
    change_column :daily_entries, :did_yesterday, :text
    change_column :daily_entries, :doing_today, :text
    change_column :daily_entries, :problems, :text
  end

  def down
    change_column :daily_entries, :did_yesterday, :string
    change_column :daily_entries, :doing_today, :string
    change_column :daily_entries, :problems, :string
  end
end
