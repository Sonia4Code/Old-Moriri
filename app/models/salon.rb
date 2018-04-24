class Salon < ApplicationRecord
  belongs_to :user

  scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") } 
  scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") } 
  scope :suburb, -> (suburb) { where("suburb ILIKE ?", "%#{suburb}%") } 

end

