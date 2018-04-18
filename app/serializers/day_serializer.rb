class DaySerializer < ActiveModel::Serializer
  attributes  :id,
              :weekday

  def weekday
    object.day_name
  end

  has_many :day_running_exercises, serializer: DayRunningExerciseSerializer
end
