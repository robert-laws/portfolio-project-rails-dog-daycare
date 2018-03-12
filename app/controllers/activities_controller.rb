class ActivitiesController < ApplicationController
  skip_before_action :login_required, only: [:show, :index]

  def index
    if params[:location_id]
      # case of nested url path
      @location = Location.find_by(id: params[:location_id])
      if @location.nil?
        redirect_to activities_path, alert: "Location not found"
      else
        @activities = @location.activities
      end
    else
      @activities = Activity.all
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
