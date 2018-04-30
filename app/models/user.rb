class User < ApplicationRecord

  has_secure_password  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :authentications, dependent: :destroy
  has_many :listings

  enum role: [:client, :owner, :super_admin]


  def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     first_name: auth_hash["info"]["first_name"],
     last_name: auth_hash["info"]["last_name"],
     avatar: auth_hash["info"]["image"],
     email: auth_hash["info"]["email"],
     password_digest: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
  end

 # grab tokens to access different providers' user info
  def google_token
    x = self.authentications.find_by(provider: 'google')
    return x.token unless x.nil?
  end

  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end

 
end
