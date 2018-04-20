module Api
  module V1
    class WeeksController < ApplicationController

      def index
        json_with Week.all
      end
    end
  end
end
