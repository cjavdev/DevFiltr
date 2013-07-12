class CreateAssessmentInvites < ActiveRecord::Migration
  def change
    create_table :assessment_invites do |t|
      t.integer :assessment_id
      t.string :email
      t.boolean :taken, :default => false

      t.timestamps
    end
  end
end
