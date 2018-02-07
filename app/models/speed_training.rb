class SpeedTraining < ApplicationRecord
  has_many :day_running_exercises, as: :runnable
  validates_presence_of :num_times, :distance, :rep_seconds_rest, :round_seconds_rest, :round_order
end
