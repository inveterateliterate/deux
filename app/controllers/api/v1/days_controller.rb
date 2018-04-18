module Api
  module V1
    class DaysController < ApplicationController

      def index
        days = Week.find(params[:week_id]).days.includes(:day_running_exercises)
        json_with days
      end

      def show
        day = Day.find(params[:id]).includes(day_running_exercises: :runnables)
        json_with day
      end
    end
  end
end
