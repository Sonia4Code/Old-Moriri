class AddColumnsToListings < ActiveRecord::Migration[5.1]
  def change

    add_column :listings, :suburb, :string
    add_column :listings, :address, :string
    add_column :listings, :contact_person, :string

  end
end
