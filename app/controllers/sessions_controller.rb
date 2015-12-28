class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to manage_ideas_path
    else
      flash[:alert] = 'Dados inválidos'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url
  end
end
