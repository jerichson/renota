class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :assignment_name
      t.integer :question_number
      t.string :solution
      t.integer :student_id

      t.timestamps
    end
  end
end
