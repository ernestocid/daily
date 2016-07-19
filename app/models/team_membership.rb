class TeamMembership < ApplicationRecord
  belongs_to :member, :class_name => 'User', :foreign_key => 'member_id'
  belongs_to :team, :class_name => 'Team', :foreign_key => 'team_id'
end
