class CartsController < ApplicationController
  before_filter :user_signed_in?

  def show
    @current_cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = Cart.find_by(id: params[:id])
    @order = Order.create(user_id: current_user.id)

    @cart.line_items.each do |line_item|
      @order.line_items << line_item
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
      line_item.save
      @order.save
    end

    @cart.status = "submitted"
    @cart.save
    current_user.current_cart = nil

    redirect_to cart_path(@cart)
  end
end
