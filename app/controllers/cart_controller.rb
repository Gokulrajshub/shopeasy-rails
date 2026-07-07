class CartController < ApplicationController
  def show
    @cart = current_user.cart
    @cart_items = @cart&.cart_items&.includes(:product)
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    cart = current_user.cart || current_user.create_cart

    cart_item = cart.cart_items.find_by(product_id: product.id)

    if cart_item
      cart_item.increment!(:quantity)
    else
      cart.cart_items.create(product_id: product.id, quantity: 1)
    end
    flash[:success] = "#{product.name} added to cart!"
    redirect_back fallback_location: user_home_path
  end

  def remove_from_cart
    cart = current_user.cart
    cart_item = cart.cart_items.find_by(product_id: params[:product_id])
    cart_item.destroy
    redirect_to cart_path
  end
end
