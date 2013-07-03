class AssessmentAttempt < ActiveRecord::Base
  attr_accessible :candidate_id, :finished_at, :solution, :started_at, :title, :assessment_id
  attr_reader :report, :example_count, :pending_count, :failure_count
  
  
  validates :title, presence: true
  validates :candidate_id, presence: true
  
  belongs_to :candidate, class_name: "User", foreign_key: :candidate_id
  belongs_to :assessment, :inverse_of => :assessment_attempts
  
  after_commit :report
  
  def report
    specs = self.assessment.specs
    g = Grader.create(:ruby, specs, self.solution, :html).grade
    @report = g.report
    @example_count = g.example_count
    @pending_count = g.pending_count
    @failure_count = g.failure_count
    @report
  end
  
end
