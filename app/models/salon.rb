class Salon < ApplicationRecord
  has_one :user

  scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") } 
  scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") } 
  scope :suburb, -> (suburb) { where("suburb ILIKE ?", "%#{suburb}%") } 

  paginates_per 12

end

