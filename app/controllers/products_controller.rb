class ProductsController < ApplicationController
  before_action :only_admin, only: [ :add_new_product, :create_product, :update_product, :destroy ]
  def all_products
    @products = Product.all
  end

  def add_new_product
    @product = Product.new
  end

  def create_product
    Rails.logger.debug "PARAMS: #{params.inspect}"
    puts "PARAMSsssssssss: #{params}"
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product added successfully!"
      redirect_to add_new_product_path
    else
      flash.now[:error] = "Failed to add product!"
      render :add_new_product
    end
  end

  def update_product
    @products = Product.find(params[:id])
    if @products.update(product_params)
      flash[:success] = "Product updated successfully!"
      redirect_to products_path
    else
      flash[:error] = "Failed to update product!"
      redirect_to products_path
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy
    flash[:success] = "Product deleted successfully!"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:id, :name, :price, :description, :stock, :image, :category)
  end
end
