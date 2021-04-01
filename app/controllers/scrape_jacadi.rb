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
      link = image.css("img").attr('src').to_s
      @product.image_url = "https://www.jacadi.fr#{link}"
    end

    items.each do |item|
      @product.name = item.css("h1").text
      @product.price = item.css("j-prd-price p").text.to_f
    end
    # 5 - Save product in database
    @product.save!
  end
