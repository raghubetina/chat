require "rails_helper"

RSpec.describe "topics#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/topics/#{topic.id}", payload
  end

  describe "basic update" do
    let!(:topic) { create(:topic) }

    let(:payload) do
      {
        data: {
          id: topic.id.to_s,
          type: "topics",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(TopicResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { topic.reload.attributes }
    end
  end
end
