class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
    can [:index, :take, :submit_test], Test
    can [:show, :update, :create, :leaderboard], User
    end
  end
end
