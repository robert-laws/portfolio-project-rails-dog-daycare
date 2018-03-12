class LocationsController < ApplicationController
  skip_before_action :login_required, only: [:show, :index]

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end
end
