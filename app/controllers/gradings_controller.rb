class GradingsController < ApplicationController
  before_action :set_grading, only: [:show, :edit, :update, :destroy]

  # GET /gradings
  def index
    @gradings = Grading.all
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
      redirect_to @grading, notice: 'Grading was successfully created.'
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
    # Use callbacks to share common setup or constraints between actions.
    def set_grading
      @grading = Grading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grading_params
      params.require(:grading).permit(:teacher_id, :submission_id, :marked_work, :grade, :feedback)
    end
end
