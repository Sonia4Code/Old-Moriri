class Listing < ApplicationRecord
  has_one :user


  scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") }
  scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") } 
  
end
