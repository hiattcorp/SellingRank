class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def edit
    @user = User.find(params[:id])
  end

  helper_method :current_user

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      redirect_to @user,
      notice: "Thank you for signing up #{@user.first_name.capitalize}"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :password, :password_confirmation
    )
  end
end
