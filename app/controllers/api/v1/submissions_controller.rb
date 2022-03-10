class Api::V1::SubmissionsController < Api::V1::GraphitiController
  def index
    submissions = SubmissionResource.all(params)
    respond_with(submissions)
  end

  def show
    submission = SubmissionResource.find(params)
    respond_with(submission)
  end

  def create
    submission = SubmissionResource.build(params)

    if submission.save
      render jsonapi: submission, status: 201
    else
      render jsonapi_errors: submission
    end
  end

  def update
    submission = SubmissionResource.find(params)

    if submission.update_attributes
      render jsonapi: submission
    else
      render jsonapi_errors: submission
    end
  end

  def destroy
    submission = SubmissionResource.find(params)

    if submission.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: submission
    end
  end
end
