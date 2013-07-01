class Assessment < ActiveRecord::Base
  attr_accessible :administrator_id, :difficulty, :instructions, :language, :specs, :time_limit, :title
  
  validates :administrator_id, presence: true

  validates :difficulty, presence: true, :numericality => {
    only_integer: true, greater_than: 0, less_than_or_equal_to: 5
  }
  
  validates :time_limit, presence: true, :numericality => {
    only_integer: true, greater_than: 0, less_than_or_equal_to: 60
  }
  
  validates :instructions, :language, :specs, :title, presence: true
  
  has_many :assessment_attempts
  belongs_to :administrator, class_name: "User", foreign_key: :administrator_id
end
