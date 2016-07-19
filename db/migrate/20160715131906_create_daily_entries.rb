class CreateDailyEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_entries do |t|
      t.string :did_yesterday
      t.string :doing_today
      t.string :problems
      t.date :posted_on

      t.timestamps
    end
  end
end
