class Api::V1::TopicsController < Api::V1::GraphitiController
  def index
    topics = TopicResource.all(params)
    respond_with(topics)
  end

  def show
    topic = TopicResource.find(params)
    respond_with(topic)
  end

  def create
    topic = TopicResource.build(params)

    if topic.save
      render jsonapi: topic, status: 201
    else
      render jsonapi_errors: topic
    end
  end

  def update
    topic = TopicResource.find(params)

    if topic.update_attributes
      render jsonapi: topic
    else
      render jsonapi_errors: topic
    end
  end

  def destroy
    topic = TopicResource.find(params)

    if topic.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: topic
    end
  end
end
