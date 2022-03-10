require 'rails_helper'

RSpec.describe Grading, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:submission) }

    it { should belong_to(:teacher) }

    end

    describe "InDirect Associations" do

    it { should have_one(:student) }

    end

    describe "Validations" do

    it { should validate_presence_of(:grade) }

    it { should validate_presence_of(:marked_work) }

    it { should validate_presence_of(:submission_id) }

    it { should validate_presence_of(:teacher_id) }

    end
end
