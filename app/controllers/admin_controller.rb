class AdminController < ApplicationController
  before_action :only_admin

  def dashboard
    @total_users = User.where(role: 0).count
    @total_products = Product.count
    @total_orders = Order.count
    @recent_orders = Order.includes(:user).order(created_at: :desc).limit(5)
  end

  def orders
    @orders = Order.includes(:user, order_items: :product).order(created_at: :desc)
  end

  def update_status
    @order = Order.find_by(id: params[:id])
    @order.update(status: params[:status])
    flash[:success] = "Order status has been updated!"
    redirect_to admin_orders_path
  end
end
