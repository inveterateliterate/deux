class ApplicationController < ActionController::API
  include RailsUtil::JsonHelper

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
end
