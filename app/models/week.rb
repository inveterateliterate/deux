class Week < ApplicationRecord
  has_many :days

  validates_presence_of :week_num
end
