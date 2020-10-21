class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]

  # GET /topics
  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).includes(:room, :messages).page(params[:page]).per(10)
  end

  # GET /topics/1
  def show
    @message = Message.new
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit; end

  # POST /topics
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

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "Topic was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /topics/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def topic_params
    params.require(:topic).permit(:room_id, :name)
  end
end
