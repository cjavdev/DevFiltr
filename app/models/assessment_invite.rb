class AssessmentInvite < ActiveRecord::Base
  attr_accessible :assessment_id, :email, :taken
  validates :email, presence: true
  belongs_to :assessment
end
