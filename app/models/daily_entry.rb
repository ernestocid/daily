class DailyEntry < ApplicationRecord
  belongs_to :user
  belongs_to :team, :class_name => 'Team', :foreign_key => 'team_id'
end
