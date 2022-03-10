class StudentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many :submissions

  # Indirect associations

  has_many :gradings do
    assign_each do |student, gradings|
      gradings.select do |g|
        g.id.in?(student.gradings.map(&:id))
      end
    end
  end
end
