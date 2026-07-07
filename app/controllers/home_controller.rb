class HomeController < ApplicationController
  skip_before_action :require_login, only: [ :home_page ]
  def home_page
    @products = Product.limit(8)
  end
end
