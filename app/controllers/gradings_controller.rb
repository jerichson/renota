class GradingsController < ApplicationController
  before_action :current_teacher_must_be_grading_teacher,
                only: %i[edit update destroy]

  before_action :set_grading, only: %i[show edit update destroy]

  def index
    @q = Grading.ransack(params[:q])
    @gradings = @q.result(distinct: true).includes(:teacher, :submission,
                                                   :student).page(params[:page]).per(10)
  end

  def show; end

  def new
    @grading = Grading.new
  end

  def edit; end

  def create
    @grading = Grading.new(grading_params)

    if @grading.save
      message = "Grading was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @grading, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @grading.update(grading_params)
      redirect_to @grading, notice: "Grading was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @grading.destroy
    message = "Grading was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to gradings_url, notice: message
    end
  end

  private

  def current_teacher_must_be_grading_teacher
    set_grading
    unless current_teacher == @grading.teacher
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_grading
    @grading = Grading.find(params[:id])
  end

  def grading_params
    params.require(:grading).permit(:teacher_id, :submission_id,
                                    :marked_work, :grade, :feedback)
  end
end
