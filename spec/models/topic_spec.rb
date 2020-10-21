require 'rails_helper'

RSpec.describe Topic, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:messages) }

    it { should belong_to(:room) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
