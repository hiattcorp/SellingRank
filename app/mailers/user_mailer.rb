class UserMailer < ApplicationMailer
  # TODO - Fix the default 'from' address
  default from: 'no-reply@sellingrank.com'

  def welcome_email(user)
    @user = user
    # TODO - Actually link the profile page
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Selling Rank!')
  end

  def submit_contact_form(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    mail(from: @email, to: 'timsjpark@gmail.com', subject: 'Support Ticket #123')
  end
end
