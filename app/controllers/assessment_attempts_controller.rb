class AssessmentAttemptsController < ApplicationController
  def index
    @assessment_attempts = AssessmentAttempt.all
    render :json => @assessment_attempts
  end

  def show
    @assessment_attempt = AssessmentAttempt.find(params[:id])
    render :json => @assessment_attempt
  end

  def new
    @assessment = Assessment.find(params[:id])
    @assessment_attempt = @assessment.assessment_attempts.build
  end
  
  def create
    
    @assessment_attempt = current_user.assessment_attempts.new(params[:assessment_attempt])
    if @assessment_attempt.save
      render :json => @assessment_attempt
    else
      render :json => @assessment_attempt.errors.full_messages, :status => 422
    end
  end

  def edit
    @assessment_attempt = AssessmentAttempt.find(params[:id])
  end
  
  def update
    @assessment_attempt = AssessmentAttempt.find(params[:id])
    @assessment_attempt.update_attributes(params[:assessment_attempt])
    if @assessment_attempt.save
      render :json => @assessment_attempt
    else
      render :json => @assessment_attempt.errors.full_messages, :status => 422
    end
  end
end
