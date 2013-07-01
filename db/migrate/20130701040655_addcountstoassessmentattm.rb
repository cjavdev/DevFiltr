class Addcountstoassessmentattm < ActiveRecord::Migration
  def change
    add_column :assessment_attempts, :example_count, :integer
    add_column :assessment_attempts, :failure_count, :integer
    add_column :assessment_attempts, :pending_count, :integer
  end
end
