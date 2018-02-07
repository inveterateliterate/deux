class Suicide < ApplicationRecord
  has_many :day_running_exercises, as: :runnable
  validates_presence_of :num_times, :int_yds, :int_times, :round_minutes_rest

  scope :one_fiftys, -> { where(int_times: 3) }
  scope :three_hundreds, -> { where(int_times: 6) }
end
