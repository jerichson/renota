class AddTeacherReferenceToGradings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gradings, :teachers
    add_index :gradings, :teacher_id
    change_column_null :gradings, :teacher_id, false
  end
end
