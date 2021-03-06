class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:reset_password]

  def login
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to root_path,
        notice: "Welcome back #{user.first_name.titleize}"
    else
      flash[:error] = 'Invalid email or password'
      render :login
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path,
      notice: "#{'You'} have been logged out."
  end


  def oauth
    @user = User.where(email: omniauth_options[:email]).first_or_initialize(omniauth_options)
    if @user.persisted?
      session[:id] = @user.id
      redirect_to root_path,
        notice: "Welcome back #{@user.first_name.titleize}."
    else
      render 'users/new'
    end
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    new_password = SecureRandom.hex(8)
    @user.update(password: new_password, password_confirmation: new_password)
    UserMailer.reset_password(@user.id, new_password).deliver
    redirect_to root_path,
      notice: "Your new password has been emailed to you."
  end

  private

  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
      {
        email: auth_hash[:info][:email],
        first_name: first_name,
        last_name: last_name,
        omniauth: true
      }
    end
  end
end
