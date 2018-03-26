class Listing < ApplicationRecord
  belongs_to :user


  scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") }
  scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") } 
  
end
