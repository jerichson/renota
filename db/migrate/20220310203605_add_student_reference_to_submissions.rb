class AddStudentReferenceToSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :submissions, :students
    add_index :submissions, :student_id
    change_column_null :submissions, :student_id, false
  end
end
