class Report < ActiveRecord::Base
  attr_accessible :assessment_attempt_id, :example_count, :failure_count, :html_report, :json_report, :pending_count, :is_error

  belongs_to :assessment_attempt, :class_name => "AssessmentAttempt", :foreign_key => :assessment_attempt_id
end
