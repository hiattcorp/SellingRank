class Option < ActiveRecord::Base
  include ActiveModel::AttributeMethods

  belongs_to :question

  attr_reader :score
end
