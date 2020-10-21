class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[show edit update destroy]

  def index
    @q = Membership.ransack(params[:q])
    @memberships = @q.result(distinct: true).includes(:user, :team).page(params[:page]).per(10)
  end

  def show; end

  def new
    @membership = Membership.new
  end

  def edit; end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      message = "Membership was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @membership, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @membership.update(membership_params)
      redirect_to @membership, notice: "Membership was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @membership.destroy
    message = "Membership was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to memberships_url, notice: message
    end
  end

  private

  def set_membership
    @membership = Membership.find(params[:id])
  end

  def membership_params
    params.require(:membership).permit(:user_id, :team_id, :role)
  end
end
