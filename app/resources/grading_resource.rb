class GradingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :teacher_id, :integer
  attribute :submission_id, :integer
  attribute :marked_work, :string
  attribute :grade, :float
  attribute :feedback, :string

  # Direct associations

  belongs_to :submission

  belongs_to :teacher

  # Indirect associations

end
