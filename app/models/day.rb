class Day < ApplicationRecord
  belongs_to :week

  validates_presence_of :day_index

  def day_name
    Date::DAYNAMES[day_index]
  end
end
