class Grading < ApplicationRecord
  # Direct associations

  belongs_to :submission

  belongs_to :teacher

  # Indirect associations

  # Validations

  validates :grade, :presence => true

  validates :marked_work, :presence => true

  validates :submission_id, :presence => true

  validates :teacher_id, :presence => true

  # Scopes

  def to_s
    teacher.to_s
  end

end
