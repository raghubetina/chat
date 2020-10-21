require "rails_helper"

RSpec.describe "topics#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/topics/#{topic.id}", params: params
  end

  describe "basic fetch" do
    let!(:topic) { create(:topic) }

    it "works" do
      expect(TopicResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("topics")
      expect(d.id).to eq(topic.id)
    end
  end
end
