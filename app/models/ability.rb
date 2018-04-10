class Ability
  include CanCan::Ability
    def initialize(user)
      user ||= User.new # guest user
      
      if user.role? :super_admin
        can :manage, :all
      else
        can :read, :all
        # can :create, Review
        # can :update, Review do |review|
        #   review.try(:user) == user || user.role?(:client)
      end
      if user.role?(:owner)
        can :create, Listing
        can :update, Listing do |listing|
        listing.try(:user) == user
        end
      end
     end
    end
  end
end
