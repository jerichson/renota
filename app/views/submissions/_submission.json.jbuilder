json.extract! submission, :id, :assignment_name, :question_number, :solution, :student_id, :created_at, :updated_at
json.url submission_url(submission, format: :json)
