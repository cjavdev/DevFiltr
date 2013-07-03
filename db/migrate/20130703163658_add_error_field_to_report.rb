class AddErrorFieldToReport < ActiveRecord::Migration
  def change
    add_column :reports, :is_error, :boolean
  end
end
