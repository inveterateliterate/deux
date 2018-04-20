class Week < ApplicationRecord
  has_many :days, dependent: :destroy
  has_many :day_running_exercises, through: :days

  validates_presence_of :num

  module Statuses
    NOT_STARTED = 'Not Started'
    IN_PROGRESS = 'In Progress'
    COMPLETED = 'Completed'
  end
end
