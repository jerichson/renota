class Api::V1::GradingsController < Api::V1::GraphitiController
  def index
    gradings = GradingResource.all(params)
    respond_with(gradings)
  end

  def show
    grading = GradingResource.find(params)
    respond_with(grading)
  end

  def create
    grading = GradingResource.build(params)

    if grading.save
      render jsonapi: grading, status: 201
    else
      render jsonapi_errors: grading
    end
  end

  def update
    grading = GradingResource.find(params)

    if grading.update_attributes
      render jsonapi: grading
    else
      render jsonapi_errors: grading
    end
  end

  def destroy
    grading = GradingResource.find(params)

    if grading.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: grading
    end
  end
end
