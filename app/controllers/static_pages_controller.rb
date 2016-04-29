class StaticPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:submit_contact_form]

  def about
  end

  def contact
  end

  def home
  end

  def user
  end

  def submit_contact_form
    UserMailer.submit_contact_form(params).deliver
    redirect_to contact_path,
      notice: "Thank you for emailing us! We will get back to you as soon as possible."
  end


  def password_reset_form
  end
end
