class LocationsController < ApplicationController
  skip_before_action :login_required, only: [:show, :index]

  def index
    @locations = Location.all
    capacity_min = params["min_capacity"].present? ? params["min_capacity"].to_i : Location.min_value("capacity")
    capacity_max = params["max_capacity"].present? ? params["max_capacity"].to_i : Location.max_value("capacity")
    @locations = @locations.values_between("capacity", capacity_min, capacity_max) unless capacity_max < capacity_min
    size_min = params["min_size"].present? ? params["min_size"].to_i : Location.min_value("size")
    size_max = params["max_size"].present? ? params["max_size"].to_i : Location.max_value("size")
    @locations = @locations.values_between("size", size_min, size_max) unless size_max < size_min
    open_year_min = params["min_open_year"].present? ? params["min_open_year"].to_i : Location.min_value("open_year")
    open_year_max = params["max_open_year"].present? ? params["max_open_year"].to_i : Location.max_value("open_year")
    @locations = @locations.values_between("open_year", open_year_min, open_year_max) unless open_year_max < open_year_min
    city = params["city"] if params["city"].present?
    @locations = @locations.select_by_city(city) unless city.nil? 
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
      @activities = Activity.all
      @activity = @location.activities.build
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    @activities = Activity.all
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location), notice: "Your location was updated successfully."
    else
      render :edit
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :city, :capacity, :size, :open_year, activity_ids: [], activities_attributes: [:id, :name, :description, :best_for_type, :best_for_size, :energy_usage])
  end
end
