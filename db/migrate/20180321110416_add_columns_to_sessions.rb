class AddColumnsToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :email, :string
    add_column :sessions, :password, :string
  end
end
