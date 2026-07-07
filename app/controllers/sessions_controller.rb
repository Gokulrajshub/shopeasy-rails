class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
    render :login_form
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])

        session[:user_id] = user.id
        flash[:success] = "Welcome back, #{user.name}!"
      if user.user?

        redirect_to user_home_path
      else
        redirect_to admin_dashboard_path
      end
    else
      flash.now[:error] = "Invalid email or password"
      render :login_form, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully!"
    redirect_to login_path
  end
end
