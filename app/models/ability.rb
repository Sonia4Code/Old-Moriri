class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user
      
      if user.super_admin?
        can :manage, :all
      else
        can :read, :all
        # can :create, Review
        # can :update, Review do |review|
        #   review.try(:user) == user || user.role?(:client)
      end
      if user.owner?
        can :create, Salon
        can :update,  Salon do |salon|
        # salon.try(:user) == user
        end
        can :destroy,  Salon do |salon|
        # salon.try(:user) == user
        end
        
    end
  end
end
