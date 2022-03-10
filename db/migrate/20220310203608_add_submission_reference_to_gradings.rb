class AddSubmissionReferenceToGradings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gradings, :submissions
    add_index :gradings, :submission_id
    change_column_null :gradings, :submission_id, false
  end
end
