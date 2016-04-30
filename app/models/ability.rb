class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.basic?
      can [:index, :take, :submit_test], Test
      can [:show, :update, :leaderboard, :create], User
    else
      can [:create, :leaderboard], User
    end
  end
end
