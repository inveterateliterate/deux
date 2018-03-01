class MileRunSerializer < ActiveModel::Serializer
  attributes  :id,
              :type,
              :num_times,
              :time_per,
              :rest_between
end
