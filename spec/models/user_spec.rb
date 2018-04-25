require "rails_helper"

RSpec.describe User, type: :model do

  context "associations: " do
    it { is_expected.to have_secure_password}
  end 

  context "validations: " do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  context "associations: " do
    it { should have_many(:authentications) }
    it { should have_many(:salons) }
  end


end

