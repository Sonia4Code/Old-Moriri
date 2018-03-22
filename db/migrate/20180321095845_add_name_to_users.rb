class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :first_name, :string, null: false
    remove_column :users, :last_name, :string , null: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    end
end
