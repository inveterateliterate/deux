class Day < ApplicationRecord
  belongs_to :week
  has_many :day_running_exercises
  validates_presence_of :day_index

  scope :for_day, -> (day_index) { where(day_index: day_index) }

  def day_name
    Date::DAYNAMES[day_index]
  end
end
