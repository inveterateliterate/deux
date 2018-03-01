class DayRunningExerciseSerializer < ActiveModel::DayRunningExerciseSerializer
  embed :ids

  attributes  :id,
              :completed

  belongs_to :day
  belongs_to :runnable, polymorphic: true
end
