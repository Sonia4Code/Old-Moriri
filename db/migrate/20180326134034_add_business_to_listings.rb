class AddBusinessToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :business_name, :string
  end
end
