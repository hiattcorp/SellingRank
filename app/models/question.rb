class Question < ActiveRecord::Base
  belongs_to :test
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options,
    allow_destroy:  true
end