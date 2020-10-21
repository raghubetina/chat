require "rails_helper"

RSpec.describe TopicResource, type: :resource do
  describe "serialization" do
    let!(:topic) { create(:topic) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(topic.id)
      expect(data.jsonapi_type).to eq("topics")
    end
  end

  describe "filtering" do
    let!(:topic1) { create(:topic) }
    let!(:topic2) { create(:topic) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: topic2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([topic2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:topic1) { create(:topic) }
      let!(:topic2) { create(:topic) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      topic1.id,
                                      topic2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      topic2.id,
                                      topic1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
