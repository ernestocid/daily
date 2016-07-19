class AddLeaderRefToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :leader, foreign_key: true
  end
end
