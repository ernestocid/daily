class RemoveLeaderIdFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :leader_id, :integer
  end
end
