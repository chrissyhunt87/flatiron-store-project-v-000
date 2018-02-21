class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])
    @current_user = current_user
  end

end
