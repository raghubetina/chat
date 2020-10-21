class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).includes(:room, :messages).page(params[:page]).per(10)
  end

  def show
    @message = Message.new
  end

  def new
    @topic = Topic.new
  end

  def edit; end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      message = "Topic was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @topic, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "Topic was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    message = "Topic was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to topics_url, notice: message
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:room_id, :name)
  end
end
