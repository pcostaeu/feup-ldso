class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def not_found
    render :file => "/public/404.html",  :status => 404
  end
   private
   def current_user
     Admin.where(id: session[:admin_id]).first
   end
   helper_method :current_user

   def login_required
    redirect_to('/') if current_user.blank?
   end

end
