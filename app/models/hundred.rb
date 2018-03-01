class Hundred < ApplicationRecord
  has_many :day_running_exercises, as: :runnable
  validates_presence_of :num_times
end
