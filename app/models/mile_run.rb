class MileRun < ApplicationRecord
  has_many :day_running_exercises, as: :runnable
  validates_presence_of :type, :num_times, :time_per, :rest_between

  module MileRunTypes
    HALF_MILE = 'HalfMile'
    FULL_MILE = 'FullMile'
    ALL = [HALF_MILE, FULL_MILE]
  end

  def model_name
    MileRun.model_name
  end
end
