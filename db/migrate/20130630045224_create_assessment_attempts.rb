class CreateAssessmentAttempts < ActiveRecord::Migration
  def change
    create_table :assessment_attempts do |t|
      t.integer :candidate_id
      t.datetime :started_at
      t.datetime :finished_at
      t.string :title
      t.text :solution

      t.timestamps
    end
  end
end
