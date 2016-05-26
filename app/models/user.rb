class User < ActiveRecord::Base
  has_many :carts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :current_cart
  
end
