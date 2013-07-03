class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :html_report
      t.text :json_report
      t.integer :example_count
      t.integer :failure_count
      t.integer :pending_count
      t.integer :assessment_attempt_id

      t.timestamps
    end
  end
end
