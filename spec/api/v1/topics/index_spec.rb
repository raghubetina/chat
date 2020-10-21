require 'rails_helper'

RSpec.describe "topics#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/topics", params: params
  end

  describe 'basic fetch' do
    let!(:topic1) { create(:topic) }
    let!(:topic2) { create(:topic) }

    it 'works' do
      expect(TopicResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['topics'])
      expect(d.map(&:id)).to match_array([topic1.id, topic2.id])
    end
  end
end
