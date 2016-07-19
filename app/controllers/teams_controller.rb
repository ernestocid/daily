class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @users = User.all
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_member
    @team = Team.find(params[:id])
    @member = User.find(params[:user][:id])

    # TODO: logic in the controller is not good. Find out how to
    # do this in the model layer.
    unless @team.members.include? @member
      @team.members.push(@member)
    end

    redirect_to team_path(@team)
  end

  def my_teams
    @dailys_by_teams = Hash.new
    @teams_responsible_for = Team.where("leader_user_id = ?", current_user.id)

    @teams_responsible_for.each do |team|
      todays_dailys = DailyEntry.where("created_at > ? and team_id = ?", Time.zone.now.beginning_of_day, team.id).to_a
      if todays_dailys.any?
        @dailys_by_teams[team.id] = todays_dailys
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :leader_user_id)
    end
end
