class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @list = List.find(params[:id])
    @product = Product.new(product_params)
    @product.list = @list

    if @product.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @list.product.update(product_params)

    redirect_to list_path(@list)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to list_path(@list.product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :price, :picture)
  end
end
