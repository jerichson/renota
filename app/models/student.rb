class Student < ApplicationRecord
  # Direct associations

  has_many   :submissions,
             dependent: :destroy

  # Indirect associations

  has_many   :gradings,
             through: :submissions,
             source: :gradings

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
