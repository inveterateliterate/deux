class SpeedTrainingSerializer < ActiveModel::Serializer
  attributes  :id,
              :num_times,
              :distance,
              :rep_seconds_rest,
              :round_minutes_rest,
              :round_order
end
