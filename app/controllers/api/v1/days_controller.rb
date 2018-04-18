module Api
  module V1
    class DaysController < ApplicationController

      def index
        days = Week.find(params[:week_id]).days
        json_with days
      end
    end
  end
end
