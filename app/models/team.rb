class Team < ApplicationRecord
  belongs_to :leader, :class_name => 'User', :foreign_key => 'leader_user_id'
  has_many :daily_entries, :class_name => 'DailyEntry'
  has_many :team_memberships
  has_many :members, through: :team_memberships
end
