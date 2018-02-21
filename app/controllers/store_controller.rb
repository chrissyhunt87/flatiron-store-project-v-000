class StoreController < ApplicationController

  def index
    @current_user = current_user
    @categories = Category.all
    @items = Item.all.select { |i| i.inventory > 0 }
  end
end
