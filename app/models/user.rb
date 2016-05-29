class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def current_cart=(cart)
     Cart.find_or_create_by(cart.id) if cart
   end

   def current_cart
     Cart.find_by(user_id: self.id, status: "pending")
   end
end
