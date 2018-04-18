module Api
  module V1
    class DayRunningExercisesController < ApplicationController

      def index
        running_exercises = Day.find(params[:day_id]).day_running_exercises.joins(:runnables)
        json_with running_exercises
      end

      # def show
      #   day = Day.find(params[:id]).includes(day_running_exercises: :runnables)
      #   json_with day
      # end
    end
  end
end
