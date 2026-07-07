Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#home_page"
  get "/products/add_new_product", to: "products#add_new_product", as: "add_new_product"
  post "/products/create_product", to: "products#create_product", as: "create_product"
  delete "/products/:id", to: "products#destroy", as: "delete_product"

  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"

  get  "/login",  to: "sessions#new", as: "login"
  post "/login",  to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "logout"

  get "/products", to: "products#all_products", as: "products"

  get "admin/dashboard" # admin_dashboard_path - its auto generated path while generating admin controller
  get "/user/home", to: "users#home", as: "user_home"

  patch "/products/:id", to: "products#update_product", as: "update_product"

  post "/cart/add/:product_id", to: "cart#add_to_cart", as: "add_to_cart"
  delete "/cart/remove/:product_id", to: "cart#remove_from_cart", as: "remove_from_cart"
  get "/cart", to: "cart#show", as: "cart"
  patch "/cart/increase/:product_id", to: "cart#increase", as: "increase_cart"
  patch "/cart/decrease/:product_id", to: "cart#decrease", as: "decrease_cart"
  post "/checkout", to: "orders#checkout", as: "checkout"

  get "/orders", to: "orders#index", as: "orders"

  get '/admin/orders', to: 'admin#orders', as: 'admin_orders'
  patch '/admin/orders/:id/update_status', to: 'admin#update_status', as: 'update_order_status'
end
