class DaySerializer < ActiveModel::Serializer
  attributes  :id,
              :day_index,
              :week_num

  has_many :day_running_exercises
end
