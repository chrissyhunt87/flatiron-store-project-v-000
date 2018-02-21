class LineItemsController < ApplicationController
  before_filter :user_signed_in?

  def create
    if current_user.current_cart.nil?
      current_user.current_cart = Cart.create(user_id: current_user.id)
    end

    @cart = current_user.current_cart
    @cart.add_item(params[:item_id]).save

    redirect_to cart_path(@cart)
  end

end
