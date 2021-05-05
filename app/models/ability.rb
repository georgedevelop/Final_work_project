# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # permissions for every user, even if not logged in    
    if user.present?  
      if user.is_admin? 
        can :manage, :all
      end

      if user.role == "IT"
      end
    end
  end
end
