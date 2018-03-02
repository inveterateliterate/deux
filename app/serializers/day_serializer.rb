class DaySerializer < ActiveModel::Serializer
  attributes  :id,
              :weekday

  def weekday
    object.day_name
  end

  belongs_to :week
  has_many :day_running_exercises
end
