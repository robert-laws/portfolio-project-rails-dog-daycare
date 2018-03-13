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
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location), notice: "Your location was created successfully."
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    @activities = Activity.all
  end

  def update

  end

  def destroy

  end

  private

  def location_params
    params.require(:location).permit(:name, :city, :capacity, :size, :open_year, activity_ids: [], activities_attributes: [:id, :name, :description, :best_for_type, :best_for_size, :energy_usage])
  end
end
