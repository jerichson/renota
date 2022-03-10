require 'rails_helper'

RSpec.describe Teacher, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:gradings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    end
end
