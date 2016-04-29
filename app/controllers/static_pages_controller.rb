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

  def password_reset_form
  end
end
