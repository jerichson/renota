require 'rails_helper'

RSpec.describe Submission, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:solution) }

    it { should validate_presence_of(:student_id) }

    end
end
