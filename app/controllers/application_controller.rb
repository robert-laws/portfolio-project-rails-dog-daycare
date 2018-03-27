class ApplicationController < ActionController::Base
  # before filter to assign a instance variable with the current user object matching the session :user_id value
  before_action :current_user

  # before filter to ensure a user is logged into the site
  before_action :login_required, except: [:home, :about, :new, :create]

  def logged_in?
    current_user
  end

  def admin?
    # returns a boolean value from the users table admin column
    @current_user.admin
  end

  private

  def login_required
    # redirect to the site root unless the current_user instance variable returns truthy
    redirect_to root_path unless logged_in?
  end

  def current_user
    # assigns a User object to a current_user instance variable if a value for :user_id is defined in a session
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin_user
    # returns a boolean value
    admin?
  end

  def current_path
    # assigns a string to a current_path instance variable based on part of the URI string
    @current_path = request.env['PATH_INFO'].split("/")[1]
  end

  def require_permission
    if current_user != User.find(params[:id])
      redirect_to root_path unless admin?
    end
  end

  helper_method :current_user
  helper_method :current_path
  helper_method :require_permission
  helper_method :admin_user
end
