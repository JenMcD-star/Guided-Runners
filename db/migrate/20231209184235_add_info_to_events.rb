class AddInfoToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :start_time, :integer
    add_column :events, :end_time, :integer
    add_column :events, :description, :text
  end
end