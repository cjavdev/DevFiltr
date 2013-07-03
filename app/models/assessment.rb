class Assessment < ActiveRecord::Base
  attr_accessible :administrator_id, :difficulty, :instructions, :language, :specs, :time_limit, :title, :skeleton, :assessment_attempts_attributes
  
  validates :administrator_id, presence: true

  validates :difficulty, presence: true, :numericality => {
    only_integer: true, greater_than: 0, less_than_or_equal_to: 5
  }
  
  validates :time_limit, presence: true, :numericality => {
    only_integer: true, greater_than: 0, less_than_or_equal_to: 60
  }
  
  validates :instructions, :language, :specs, :title, presence: true
  
  has_many :assessment_attempts, :inverse_of => :assessment
  belongs_to :administrator, class_name: "User", foreign_key: :administrator_id
  
  accepts_nested_attributes_for :assessment_attempts
  
  def as_json(options = {})
    super(options.merge({ :include => :assessment_attempts }))
  end
end
