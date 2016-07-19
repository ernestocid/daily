class RemovePostedOnFieldFromDailys < ActiveRecord::Migration[5.0]
  def change
    remove_column :daily_entries, :posted_on
  end
end
