class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @product = Product.new
  end

  def create
    @list = List.find(params[:list_id])

    @product = @list.product.new(product_params)
    @product.save!

    redirect_to list_path(@list)
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :price, :picture)
  end
end
