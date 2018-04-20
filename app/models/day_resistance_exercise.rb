class DayResistanceExercise < ApplicationRecord
  belongs_to :day
  belongs_to :resistancable, polymorphic: true

  module ResistanceExercises
    CIRCUIT_EXERCISES = 'long_run'
    INTERVAL_EXERCISE = 'hundred'
    ALL = [CIRCUIT_EXERCISES, INTERVAL_EXERCISE]
  end
end
