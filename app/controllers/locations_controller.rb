class LocationsController < ApplicationController
  skip_before_action :login_required, only: [:show, :index]

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
    @activities = Activity.all
    @activity = @location.activities.build
  end

  def create

  end

  def edit
    @location = Location.find(params[:id])
    @activities = Activity.all
  end

  def update

  end

  def destroy

  end
end
