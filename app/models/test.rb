class Test < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions
  accepts_nested_attributes_for :questions,
                         allow_destroy:  true
end
