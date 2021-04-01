require 'Open-uri'
require 'Nokogiri'

class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @product = Product.new
  end

  def create
    # Scraping method
    @product = scrape #|| add_product
  end

  def add_product
    @list = List.find(params[:list_id])
    @product = Product.new(product_params)
    @product.list = @list

    if @product.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def scrape
    # Create a product with scraping method for Jacadi brand
    @list = List.find(params[:list_id])
    @product = Product.new(product_params)
    @product.list = @list
    page_url = @product.url
    doc = Nokogiri::HTML(URI.open(page_url))
    # 3 - select all items with css selector
    items = doc.css(".j-wrapper-content")
    # 4 - Iterate on each item to save them
    items.each do |item|
      link = item.css(".j-img img").attr('src').to_s
      @product.image_url = "https://www.jacadi.fr#{link}"
      @product.name = item.css("h1").text
      @product.price = item.css(".j-prd-price p").text.to_f
    end
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
    @product.update(product_params)
    redirect_to lists_path(@list)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
    redirect_to lists_path(@list)
  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :price, :picture, category_ids: [])
  end
end
