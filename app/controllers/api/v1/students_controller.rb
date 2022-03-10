class Api::V1::StudentsController < Api::V1::GraphitiController
  def index
    students = StudentResource.all(params)
    respond_with(students)
  end

  def show
    student = StudentResource.find(params)
    respond_with(student)
  end

  def create
    student = StudentResource.build(params)

    if student.save
      render jsonapi: student, status: 201
    else
      render jsonapi_errors: student
    end
  end

  def update
    student = StudentResource.find(params)

    if student.update_attributes
      render jsonapi: student
    else
      render jsonapi_errors: student
    end
  end

  def destroy
    student = StudentResource.find(params)

    if student.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: student
    end
  end
end
