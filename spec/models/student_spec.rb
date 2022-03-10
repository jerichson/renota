require 'rails_helper'

RSpec.describe Student, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:submissions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    end
end
