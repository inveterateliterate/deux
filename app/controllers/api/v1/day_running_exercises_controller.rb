module Api
  module V1
    class DayRunningExercisesController < ApplicationController

      def index
        running_exercises = Day.find(params[:day_id]).day_running_exercises
        json_with running_exercises
      end
    end
  end
end
