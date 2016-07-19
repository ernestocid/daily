class AddTeamIdToDaily < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_entries, :team_id, :integer
  end
end
