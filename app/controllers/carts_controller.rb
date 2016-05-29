class CartsController < ApplicationController
  def show
  if Cart.find(params[:id]).user_id == current_user.try(:id)
      @cart = Cart.find(params[:id])
    else
      redirect_to store_path
    end
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.update_inventory
    @cart.status = "submitted"
    @cart.save
    redirect_to @cart
  end

end
