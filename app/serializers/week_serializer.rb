class WeekSerializer < ActiveModel::Serializer
  attributes  :id,
              :num,
              :status
end
