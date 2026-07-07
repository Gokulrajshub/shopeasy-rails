class OrdersController < ApplicationController
  def checkout
    quantities = params[:quantities] || {}
    cart = current_user.cart

    order = current_user.orders.new(status: "pending", total_amount: 0)
    total = 0

    quantities.each do |product_id, qty|
      product = Product.find(product_id)
      quantity = qty.to_i
      amount = product.price * quantity

      order.order_items.build(
        product_id: product.id,
        quantity: quantity,
        price: product.price
      )

      product.decrement!(:stock, quantity)
      total += amount
    end

    order.total_amount = total

    if order.save
      cart.cart_items.destroy_all
      flash[:success] = "Order placed successfully!"
      redirect_to orders_path
    else
      flash[:error] = "Something went wrong!"
      redirect_to cart_path
    end
  end

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end
end
