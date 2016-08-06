class DailyEntry < ApplicationRecord
  belongs_to :user
  belongs_to :team, :class_name => 'Team', :foreign_key => 'team_id'

  def self.todays_dailys_for_teams(teams)
  	dailys_by_teams = Hash.new

  	teams.each do |team|
      team_dailys = DailyEntry.where("created_at > ? and team_id = ?", Time.zone.now.beginning_of_day, team.id).to_a
      if team_dailys.any?
        dailys_by_teams[team.id] = team_dailys
      end
    end

    return dailys_by_teams
  end
end