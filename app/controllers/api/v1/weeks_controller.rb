class WeeksController < ApplicationController

  def index
    @weeks = Week.all
  end
end
