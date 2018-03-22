class AddEmailToUsers < ActiveRecord::Migration[5.1]
  def change

    remove_column :users, :email, :string , null: false
    add_column :users, :email, :string

  end
end
