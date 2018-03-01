class Week < ApplicationRecord
  has_many :days, dependent: :destroy

  module Statuses
    NOT_STARTED = 'Not Started'
    IN_PROGRESS = 'In Progress'
    COMPLETED = 'Completed'
  end
end
