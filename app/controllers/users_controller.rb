class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "0"
    if @user.save
      flash[:success] = "Account Created Successfully!"
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def home
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
    @products = Product.all
  end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
