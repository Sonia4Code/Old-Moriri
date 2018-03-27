class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|

      t.string   :user_id 
      t.string   :country
      t.string   :location
      t.string   :title
      t.string   :description
      t.string   :business_name
      t.integer   :contact      
      t.string   :speciality, :text, array:true, default: []



      t.timestamps
    end
  end
end
