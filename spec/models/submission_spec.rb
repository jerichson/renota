require "rails_helper"

RSpec.describe Submission, type: :model do
  describe "Direct Associations" do
    it { should have_many(:gradings) }

    it { should belong_to(:student) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:assignment_name) }

    it { should validate_presence_of(:question_number) }

    it { should validate_presence_of(:solution) }

    it { should validate_presence_of(:student_id) }
  end
end
