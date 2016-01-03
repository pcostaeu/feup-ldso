class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception

  # Redirects to 404 page if page not found
  def not_found
    render file: '/public/404.html', status: 404
  end

  private

  # Defines user with login made
  def current_user
    Admin.where(id: session[:admin_id]).first
  end
  helper_method :current_user

  # Redirects to homepage if someone attemps to acess admin pages without login made
  def login_required
    redirect_to('/') if current_user.blank?
  end
end
