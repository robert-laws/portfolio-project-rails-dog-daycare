class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :login_required, except: [:home, :new, :create]

  def logged_in?
    current_user
  end

  def admin?
    @current_user.admin
  end

  private

  def login_required
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_user
    admin?
  end

  def current_path
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
