class Addassessmenttoattempt < ActiveRecord::Migration
  def change
    add_column :assessment_attempts, :assessment_id, :integer
  end
end
