require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:memberships) }

    it { should have_many(:rooms) }

    it { should have_many(:messages) }
  end

  describe "InDirect Associations" do
    it { should have_many(:teams) }
  end

  describe "Validations" do
  end
end
