class ActivitiesController < ApplicationController
  skip_before_action :login_required, only: [:show, :index]
  
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
