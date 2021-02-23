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
    @category = Category.new(category_params)
    @category.list = @list

    if @category.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
