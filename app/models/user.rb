class User < ActiveRecord::Base
  has_secure_password(validations: false)

  has_many :attempts

  validates_confirmation_of :password, if: ->(user) { !user.omniauth? && user.password.present? }
  validates_presence_of :password, on: :create, if: ->(user) { !user.omniauth? }
  validates_presence_of :password_confirmation, if: ->(user) { !user.omniauth? && user.password.present? }

  def admin?
    self.role == 'admin'
  end

  def basic?
    self.role == 'basic'
  end
end
