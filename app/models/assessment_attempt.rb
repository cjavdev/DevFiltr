class AssessmentAttempt < ActiveRecord::Base
  attr_accessible :candidate_id, :finished_at, :solution, :started_at, :title, :assessment_id
  attr_reader :report, :example_count, :pending_count, :failure_count
  
  
  validates :title, presence: true
  validates :candidate_id, presence: true
  
  belongs_to :candidate, class_name: "User", foreign_key: :candidate_id
  belongs_to :assessment, :inverse_of => :assessment_attempts
  
  has_one :report, :class_name => "Report", :foreign_key => :assessment_attempt_id
  
  def as_json(options = {})
    super(options.merge({ :include => :report }))
  end
  
  after_commit :grade_attempt
  
  def graded?
    !!self.report
  end
  
  def grade
    specs = self.assessment.specs
    
    # refactor this to work in one go...
    h_report = Grader.create(:ruby, specs, self.solution, :html).grade
    j_report = Grader.create(:ruby, specs, self.solution, :json).grade
    
    new_report = self.report = Report.new
    
    new_report.html_report = h_report.report
    new_report.json_report = j_report.report
    new_report.example_count = h_report.example_count
    new_report.pending_count = h_report.pending_count
    new_report.failure_count = h_report.failure_count
    
    if new_report.save
      true
    else
      false
    end
  end
end
