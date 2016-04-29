class UserMailer < ApplicationMailer
  default from: 'no-reply@sellingrank.com'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Selling Rank!')
  end
end
