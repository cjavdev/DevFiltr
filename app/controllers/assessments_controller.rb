class AssessmentsController < ApplicationController
  def index
    @assessments = Assessment.all
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def new
    @assessment = Assessment.new
  end
  
  def create
    @assessment = Assessment.new(params[:assessment])
    if @assessment.save
      redirect_to assessment_url(@assessment)
    else
      flash[:errors] = @assessment.errors.full_messages
      render :new
    end
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end
  
  def update
    @assessment = Assessment.find(params[:id])
    @assessment.update_attributes(params[:assessment])
    if @assessment.save
      redirect_to assessment_url(@assessment)
    else
      flash[:errors] = @assessment.errors.full_messages
      render :edit
    end
  end
end
