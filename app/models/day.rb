class Day < ApplicationRecord
  has_many :day_running_exercises
  validates_presence_of :day_index, :week_num

  def day_name
    Date::DAYNAMES[day_index]
  end
end
