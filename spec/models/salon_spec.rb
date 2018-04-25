require "rails_helper"

RSpec.describe Salon, type: :model do

  let(:user) {User.new(first_name: "Ket", last_name: "Chup", email: "ketchup@example.com", password: "sauce")}
  let(:salon) {Salon.new(location: "Melaka", user_id: user.id)}

  context "associations: " do
    it { should belong_to(:user) }
  end
    
  describe "location" do 
    context "search for salons by location" do
      it "returns a salon if found" do
        user.save
        salon.save
        expect(Salon.location("Melaka").count).to eq(1)
      end
      it "returns a message if no salon is found" do 
        expect(Salon.location("Kuta").count).to eq(0)
      end
    end
  end    
end

