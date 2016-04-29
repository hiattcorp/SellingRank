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
    mail(from: @email, to: 'timparkdummy@gmail.com', subject: 'Support Ticket #123')
  end

  def email_test_score(user, test_id, score)
    @user = user
    @test = Test.find(test_id)
    @score = score
    @attempts_left = 3 - Attempt.where(user_id: @user.id, test_id: test_id).count
    mail(to: @user.email, subject: "#{@test.name} Test Results")
  end

  def reset_password(user_id, new_password)
    @user = User.find(user_id)
    @new_password = new_password
    mail(to: @user.email, subject: 'Password Reset For Selling Rank Account')
  end
end
