# ShopEasy - E-Commerce Web Application

A full-stack e-commerce web application built with **Ruby on Rails**, featuring role-based authentication, product management, shopping cart, and order tracking.

## Features

### User Side
- User registration & login (role-based authentication)
- Browse products with category filter
- Product detail view modal
- Add to cart with real-time quantity management
- Stock validation on cart
- Place orders (Cash on Delivery)
- View order history with status tracking

### Admin Side
- Admin dashboard (Total users, products, orders stats)
- Add / Edit / Delete products with image upload (Active Storage)
- View all orders & update status (Pending → Shipped → Delivered)

## Tech Stack

| Technology 		| Usage					|
|-------------------|-----------------------|
| Ruby on Rails 7.2 | Backend Framework 	|
| MySQL 			| Database				|
| Bootstrap 5 		| UI Styling			|
| Active Storage 	| Image Upload 			|
| SweetAlert2 		| Alert Notifications 	|
| Font Awesome 		| Icons 				|

## Setup & Installation

1. **Clone the repository**
```bash
   git clone https://github.com/Gokulrajshub/shopeasy-rails.git
   cd shopeasy-rails
```

2. **Install dependencies**
```bash
   bundle install
```

3. **Set environment variables**
```bash
   # Windows
   set DB_PASSWORD=your_mysql_password

   # Mac/Linux
   export DB_PASSWORD=your_mysql_password
```

4. **Create & migrate database**
```bash
   rails db:create
   rails db:migrate
```

5. **Start the server**
```bash
   rails s
```

6. **Visit** `http://localhost:3000`

## Creating Admin Account

After setup, run Rails console to create admin user:

```bash
rails console
User.create(name: "Admin", email: "admin@example.com", password: "password123", role: 1)
```

Then login at `http://localhost:3000/login` with above credentials.

## Roles & Access

| Role 				| Access 											|
|-------------------|---------------------------------------------------|
| User (role: 0) 	| Browse products, Cart, Place orders, Order history|
| Admin (role: 1) 	| Dashboard, Product management, Order management 	|

## Project Structure

app/
├── controllers/
│   ├── admin_controller.rb      # Admin dashboard & orders
│   ├── products_controller.rb   # Product CRUD
│   ├── cart_controller.rb       # Cart management
│   ├── orders_controller.rb     # Order placement
│   ├── sessions_controller.rb   # Authentication
│   └── users_controller.rb      # User management
├── models/
│   ├── user.rb                  # Role-based auth
│   ├── product.rb               # Active Storage image
│   ├── cart.rb / cart_item.rb   # Cart logic
│   └── order.rb / order_item.rb # Order logic
└── views/
├── admin/                   # Admin pages
├── products/                # Product pages
├── cart/                    # Cart page
└── orders/                  # Order pages

## Security

- Password hashed using `has_secure_password` (bcrypt)
- Role-based access control (Admin/User)
- CSRF protection enabled
- DB credentials via environment variables