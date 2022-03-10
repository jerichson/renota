class SubmissionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :assignment_name, :string
  attribute :question_number, :integer
  attribute :solution, :string
  attribute :student_id, :integer

  # Direct associations

  has_many   :gradings

  belongs_to :student

  # Indirect associations

end
