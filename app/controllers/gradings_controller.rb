class GradingsController < ApplicationController
  before_action :current_teacher_must_be_grading_teacher, only: [:edit, :update, :destroy] 

  before_action :set_grading, only: [:show, :edit, :update, :destroy]

  # GET /gradings
  def index
    @gradings = Grading.page(params[:page]).per(10)
  end

  # GET /gradings/1
  def show
  end

  # GET /gradings/new
  def new
    @grading = Grading.new
  end

  # GET /gradings/1/edit
  def edit
  end

  # POST /gradings
  def create
    @grading = Grading.new(grading_params)

    if @grading.save
      message = 'Grading was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @grading, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /gradings/1
  def update
    if @grading.update(grading_params)
      redirect_to @grading, notice: 'Grading was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gradings/1
  def destroy
    @grading.destroy
    message = "Grading was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to gradings_url, notice: message
    end
  end


  private

  def current_teacher_must_be_grading_teacher
    set_grading
    unless current_teacher == @grading.teacher
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_grading
      @grading = Grading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grading_params
      params.require(:grading).permit(:teacher_id, :submission_id, :marked_work, :grade, :feedback)
    end
end
