class DaySerializer < ActiveModel::Serializer
  attributes  :id,
              :weekday

  def weekday
    object.day_name
  end
end
