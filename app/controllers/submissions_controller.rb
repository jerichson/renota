class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[show edit update destroy]

  def index
    @q = Submission.ransack(params[:q])
    @submissions = @q.result(distinct: true).includes(:student,
                                                      :gradings).page(params[:page]).per(10)
  end

  def show
    @grading = Grading.new
  end

  def new
    @submission = Submission.new
  end

  def edit; end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      message = "Submission was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @submission, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @submission.update(submission_params)
      redirect_to @submission, notice: "Submission was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @submission.destroy
    message = "Submission was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to submissions_url, notice: message
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:assignment_name, :question_number,
                                       :solution, :student_id)
  end
end
