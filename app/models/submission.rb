class Submission < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :student_id, :presence => true

  # Scopes

  def to_s
    assignment_name
  end

end
