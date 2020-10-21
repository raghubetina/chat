require "rails_helper"

RSpec.describe Room, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:team) }

    it { should have_many(:topics) }

    it { should belong_to(:creator) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
