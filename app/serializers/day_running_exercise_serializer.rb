class DayRunningExerciseSerializer < ActiveModel::Serializer
  # embed :ids

  attributes  :id,
              :completed,
              :runnable

  belongs_to :day
  belongs_to :runnable, polymorphic: true

  # def runnable
  #   object.runnable
  # end
end
