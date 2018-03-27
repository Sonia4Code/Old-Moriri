class Listing < ApplicationRecord
  belongs_to :user


  scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") } 
  
end

