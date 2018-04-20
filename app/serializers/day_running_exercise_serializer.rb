class DayRunningExerciseSerializer < ActiveModel::Serializer
  attributes  :id,
              :completed,
              :runnable

  belongs_to :runnable, polymorphic: true
end
