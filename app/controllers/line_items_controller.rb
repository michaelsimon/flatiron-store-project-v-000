class LineItemsController < ApplicationController
  def create
    if current_user.current_cart.nil?
      current_cart = current_user.carts.create
    else
      current_cart = current_user.current_cart
    end
    item = current_cart.add_item(params[:item_id])
    item.quantity += 1 if item.persisted?
    item.save
    redirect_to cart_path(current_cart)
  end
end
