module Api
  module V1
    class WeeksController < ApplicationController

      def index
        json_with Week.includes(:days).all
      end
    end
  end
end
