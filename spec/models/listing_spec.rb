require "rails_helper"

RSpec.describe Listing, type: :model do

  let(:user) {User.new(first_name: "Ket", last_name: "Chup", email: "ketchup@example.com", password: "sauce")}
  let(:listing) {Listing.new(location: "Melaka", user_id: user.id)}

  context "associations: " do
    it { should belong_to(:user) }
  end
    
  describe "location" do 
    context "search for listings by location" do
      it "returns a listing if found" do
        user.save
        listing.save
        expect(Listing.location("Melaka").count).to eq(1)
      end
      it "returns a message if no listing is found" do 
        expect(Listing.location("Kuta").count).to eq(0)
      end
    end
  end    
end

