class AssessmentsController < ApplicationController
  before_filter :require_login
  
  def index
    @assessments = Assessment.all
    render :json => @assessments
  end

  def show
    @assessment = Assessment.find(params[:id])
    render :json => @assessment
  end

  def new
    @assessment = Assessment.new
  end
  
  def create
    @assessment = current_user.assessments.new(params[:assessment])
    if @assessment.save
      render :json => @assessment
    else
      render :json => @assessment.errors.full_messages, :status => 422
    end
  end

  def edit
    @assessment = Assessment.find(params[:id])
  end
  
  def update
    @assessment = Assessment.find(params[:id])
    @assessment.update_attributes(params[:assessment])
    if @assessment.save
      render :json => @assessment
    else
      render :json =>  @assessment.errors.full_messages, :status => 422
    end
  end
end
