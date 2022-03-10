class Grading < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :marked_work, :presence => true

  validates :submission_id, :presence => true

  validates :teacher_id, :presence => true

  # Scopes

  def to_s
    teacher.to_s
  end

end
