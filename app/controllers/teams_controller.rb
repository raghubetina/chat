class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).includes(:rooms, :memberships).page(params[:page]).per(10)
  end

  def show
    @membership = Membership.new
    @room = Room.new
  end

  def new
    @team = Team.new
  end

  def edit; end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team, notice: "Team was successfully created."
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: "Team was successfully destroyed."
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
