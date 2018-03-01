class LongRun < ApplicationRecord
  has_many :day_running_exercises, as: :runnable
  validates_presence_of :amt_time
end
