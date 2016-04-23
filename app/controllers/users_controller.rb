class UsersController < ApplicationController
  helper_method :current_user


  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
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
      :password, :password_confirmation, :omniauth
    )
  end
end

