json.extract! grading, :id, :teacher_id, :submission_id, :marked_work, :grade,
              :feedback, :created_at, :updated_at
json.url grading_url(grading, format: :json)
