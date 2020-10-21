class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true).includes(:creator, :topics, :team).page(params[:page]).per(10)
  end

  def show
    @topic = Topic.new
  end

  def new
    @room = Room.new
  end

  def edit; end

  def create
    @room = Room.new(room_params)

    if @room.save
      message = "Room was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @room, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    message = "Room was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to rooms_url, notice: message
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :anyone_can_join, :creator_id, :team_id, :hidden)
  end
end
