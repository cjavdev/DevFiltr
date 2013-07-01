class AssessmentAttemptsController < ApplicationController
  def index
    @assessment_attempts = AssessmentAttempt.all
  end

  def show
    @assessment_attempt = AssessmentAttempt.find(params[:id])
  end

  def new
    @assessment = Assessment.find(params[:id])
    @assessment_attempt = @assessment.assessment_attempts.build
  end
  
  def create
    @assessment_attempt = AssessmentAttempt.new(params[:assessment_attempt])
    if @assessment_attempt.save
      redirect_to assessment_attempt_url(@assessment_attempt)
    else
      flash[:errors] = @assessment_attempt.errors.full_messages
      render :new
    end
  end

  def edit
    @assessment_attempt = AssessmentAttempt.find(params[:id])
  end
  
  def update
    @assessment_attempt = AssessmentAttempt.find(params[:id])
    @assessment_attempt.update_attributes(params[:assessment_attempt])
    if @assessment_attempt.save
      redirect_to assessment_attempt_url(@assessment_attempt)
    else
      flash[:errors] = @assessment_attempt.errors.full_messages
      render :edit
    end
  end
end
