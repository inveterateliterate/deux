class IntervalExercise < ApplicationRecord
  has_many :day_resistance_exercises, as: :resistancable
  validates_presence_of :exercises
end
