class AssessmentAttempt < ActiveRecord::Base
  attr_accessible :candidate_id, :finished_at, :solution, :started_at, :title, :assessment_id
  # validates :candidate
  validates :title, presence: true
  
  belongs_to :candidate, class_name: "User", foreign_key: :candidate_id
  belongs_to :assessment
end
