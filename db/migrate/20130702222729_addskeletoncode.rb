class Addskeletoncode < ActiveRecord::Migration
  def change
    add_column :assessments, :skeleton, :text
  end
end
