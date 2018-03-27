class ActivitiesController < ApplicationController
  # skips the login requirement for the activities view, allows anonymous users to view activities views
  skip_before_action :login_required, only: [:show, :index, :top]

  def index
    if params[:location_id]
      # case of nested url path for locations/:location_id/activities
      @location = Location.find_by(id: params[:location_id])
      if @location.nil?
        redirect_to activities_path, alert: "Location not found"
      else
        @activities = @location.activities
      end
    else
      @activities = Activity.all_except_custom

      Activity.columns.each do |col|
        param_value = params[col].present? ? params[col] : nil
        @activities = @activities.by_select(col, param_value) unless param_value.nil?
      end
    end
  end

  def show
    if params[:location_id]
      @location = Location.find_by(id: params[:location_id])
      @activity = @location.activities.find_by(id: params[:id])
      if @activity.nil?
        redirect_to location_activities.path(@location), alert: "Activity not found"
      end
    else
      @activity = Activity.find(params[:id])
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activity_path(@activity), notice: "Activity was successfully created"
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: "Activity was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    Activity.find(params[:id]).destroy
    redirect_to activities_path
  end

  def top
    @activity = Activity.top
    @top_count = @activity.reservation_activities.size
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :best_for_size, :best_for_type, :energy_usage)
  end
end
