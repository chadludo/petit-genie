class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @category = Category.new
  end

  def create
    @list = List.find(params[:list_id])
    @category = @list.category.create(category_params)

    redirect_to list_path(@list)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
