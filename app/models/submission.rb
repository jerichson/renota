class Submission < ApplicationRecord
  # Direct associations

  belongs_to :student

  # Indirect associations

  # Validations

  validates :assignment_name, :presence => true

  validates :question_number, :presence => true

  validates :solution, :presence => true

  validates :student_id, :presence => true

  # Scopes

  def to_s
    assignment_name
  end

end
