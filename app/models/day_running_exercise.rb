class DayRunningExercise < ApplicationRecord
  belongs_to :day
  belongs_to :runnable, polymorphic: true

  module RunningExercises
    LONG_RUN = 'long_run'
    HUNDRED = 'hundred'
    MILE_RUN = 'mile_run'
    SPEED_TRANING = 'speed_training'
    ALL = [LONG_RUN, HUNDRED, MILE_RUN, SPEED_TRANING]
  end
end
