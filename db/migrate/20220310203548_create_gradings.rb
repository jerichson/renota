class CreateGradings < ActiveRecord::Migration[6.0]
  def change
    create_table :gradings do |t|
      t.integer :teacher_id
      t.integer :submission_id
      t.string :marked_work
      t.float :grade
      t.text :feedback

      t.timestamps
    end
  end
end
