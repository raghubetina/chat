require "rails_helper"

RSpec.describe Team, type: :model do
  describe "Direct Associations" do
    it { should have_many(:memberships) }

    it { should have_many(:rooms) }
  end

  describe "InDirect Associations" do
    it { should have_many(:users) }
  end

  describe "Validations" do
  end
end
