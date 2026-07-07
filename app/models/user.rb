class User < ApplicationRecord
  has_one :cart
  has_many :orders
  has_secure_password
  enum role: { user: 0, admin: 1 }
end
