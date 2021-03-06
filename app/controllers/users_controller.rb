class UsersController < ApplicationController
  load_and_authorize_resource

  helper_method :current_user

  def show
  end

  def leaderboard
    @users = User.all
    @tests = Test.all

  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params.merge(role: 'basic'))
    if @user.save
      session[:id] = @user.id
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path,
        notice: "Thank you for signing up #{@user.first_name.capitalize}"
    else
      render :new
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :password, :password_confirmation, :omniauth, :role
    )
  end
end
