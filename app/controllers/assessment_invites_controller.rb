class AssessmentInvitesController < ApplicationController
  def index
    @invites = AssessmentInvite.all
    render :index
  end
  
  def show
    @assessment_invite = AssessmentInvite.find(params[:id])
    render :json => @assessment_invite
  end
  
  def new
    @assessment_invite = AssessmentInvite.new
  end
  
  def create
    @assessment_invite = AssessmentInvite.new(params[:assessment_invite])
    AssessmentInviteMailer.invite_email(params[:assessment_invite][:email]).deliver
    if @assessment_invite.save
      render :json => @assessment_invite
    else
      render :json => @assessment_invite.errors.full_messages
    end
  end
  
  def edit
    @assessment_invite = AssessmentInvite.find(params[:id])
  end
  
  def update
    @assessment_invite = AssessmentInvite.find(params[:id])
    if @assessment_invite.update_attributes(params[:assessment_invite])
      render :json => @assessment_invite
    else
      render :json => @assessment_invite.errors.full_messages
    end
  end
end
