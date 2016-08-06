class Team < ApplicationRecord
  belongs_to :leader, :class_name => 'User', :foreign_key => 'leader_user_id'
  has_many :daily_entries, :class_name => 'DailyEntry'
  has_many :team_memberships
  has_many :members, through: :team_memberships


  def self.teams_led_by(user)
  	Team.where("leader_user_id = ?", user.id)
  end
end
