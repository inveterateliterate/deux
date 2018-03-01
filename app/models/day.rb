class Day < ApplicationRecord
  has_many :day_running_exercises
  validates_presence_of :day_index, :week_num

  scope :for_week, -> (week_num) { where(week_num: week_num) }
  scope :for_day, -> (day_index) { where(day_index: day_index) }

  def day_name
    Date::DAYNAMES[day_index]
  end
end
