class AssessmentAttempt < ActiveRecord::Base
  attr_accessible :candidate_id, :finished_at, :solution, :started_at, :title, :assessment_id
  
  validates :title, presence: true
  validates :candidate_id, presence: true
  
  belongs_to :candidate, class_name: "User", foreign_key: :candidate_id
  belongs_to :assessment, :inverse_of => :assessment_attempts
  
  has_one :report, :class_name => "Report", :foreign_key => :assessment_attempt_id
  
  def as_json(options = {})
    super(options.merge({ :include => :report }))
  end
  
  after_commit :grade
  
  def graded?
    !!self.report
  end
  
  def grade
    specs = self.assessment.specs
    
    # refactor this to work in one go...
    h_report = Grader.create(:ruby, specs, self.solution, :html).grade
    j_report = Grader.create(:ruby, specs, self.solution, :json).grade
    
    self.report = Report.new
    
    self.report.html_report = h_report.report
    self.report.json_report = j_report.report
    self.report.example_count = h_report.example_count
    self.report.pending_count = h_report.pending_count
    self.report.failure_count = h_report.failure_count
    self.report.is_error = h_report.is_error
    if self.report.save
      true
    else
      false
    end
  end
end
