class AddStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string
    add_column :users, :integer, :string
  end
end
