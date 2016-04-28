class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'basic'
      can [:index, :take, :submit_test], Test
      can [:show, :update], User
    else
      can :create, User
    end
  end
end
