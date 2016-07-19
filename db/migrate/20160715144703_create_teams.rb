class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :leader_user_id

      t.timestamps
    end
  end
end
