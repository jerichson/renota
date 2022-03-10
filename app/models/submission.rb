class Submission < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :solution, :presence => true

  validates :student_id, :presence => true

  # Scopes

  def to_s
    assignment_name
  end

end
