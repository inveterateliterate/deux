class CircuitExercise < ApplicationRecord
  has_many :day_resistance_exercises, as: :resistancable
  validates_presence_of :type, :exercises

  module MileRunTypes
    LEGS_BACK_AB = 'LegsBackAb'
    ARMS_CHEST_AB = 'ArmsChestAb'
    FULL_BODY = 'FullBody'
    ALL = [LEGS_BACK_AB, ARMS_CHEST_AB, FULL_BODY]
  end

  def model_name
    CircuitExercise.model_name
  end
end
