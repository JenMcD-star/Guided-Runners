class AddInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :bio, :text
  end
end
