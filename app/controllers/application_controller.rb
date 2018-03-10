class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_path
    @current_path = request.env['PATH_INFO'].split("/")[1]
  end

  helper_method :current_path
end
