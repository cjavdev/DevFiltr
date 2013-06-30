class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :administrator_id
      t.integer :time_limit
      t.string :title
      t.string :language
      t.integer :difficulty
      t.text :instructions
      t.text :specs

      t.timestamps
    end
  end
end
