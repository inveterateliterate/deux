class WeekSerializer < ActiveModel::Serializer
  attributes  :id,
              :num,
              :status

  has_many :days
end
