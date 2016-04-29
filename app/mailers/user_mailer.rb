class UserMailer < ApplicationMailer
  # TODO - Fix the default 'from' address
  default from: 'no-reply@sellingrank.com'

  def welcome_email(user)
    @user = user
    # TODO - Actually link the profile page
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Selling Rank!')
  end
end
