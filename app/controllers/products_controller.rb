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
    @product = scrape || self

    # Classic create method
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
    # Create a product with scraping method
    # 1 - Get the URL from form in create view
    @list = List.find(params[:list_id])
    @product = Product.new(product_params)
    @product.list = @list
    page_url = @product.url
    # 2 - Parse the URL in nokogiri
    doc = Nokogiri::HTML(URI.open(page_url))
    # 3 - select all items with css selector
    items = doc.css("j-wrapper-content")
    # 4 - Iterate on each item to save them

    images = doc.css("div.j-img")
    images.each do |image|
      link = image.css("img").attr('src')
      @product.image_url = "https://www.jacadi.fr#{link}"
    end

    items.each do |item|
      @product.name = item.css("h1").text
      @product.price = item.css("j-prd-price p").text.to_f
    end
    # 5 - Save product in database
    @product.save!
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
