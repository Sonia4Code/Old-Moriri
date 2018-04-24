class ChangeListingsName < ActiveRecord::Migration[5.1]
  def change

    rename_table :listings, :salons
  end
end
