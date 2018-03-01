class DaySerializer < ActiveModel::Serializer
  attributes  :id,
              :day_index

  belongs_to :week
  has_many :day_running_exercises
end
