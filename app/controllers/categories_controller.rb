class CategoriesController < ApplicationController

  def index
    @current_user = current_user
    @categories = Category.all
  end

  def show
    @current_user = current_user
    @category = Category.find_by(id: params[:id])
  end

end
