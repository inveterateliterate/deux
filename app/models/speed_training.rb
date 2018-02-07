class SpeedTraining < ApplicationRecord
  has_many :day_running_exercises, as: :runnable
  validates_presence_of :num_times, :distance, :rep_seconds_rest, :round_order

  scope :sixties, -> { where(distance: '60') }
  scope :forties, -> { where(distance: '40') }
  scope :twenties, -> { where(distance: '20') }
  scope :shuttles, -> { where(distance: '5/10/15') }
end
