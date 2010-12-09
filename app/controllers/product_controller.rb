class ProductController < ApplicationController
  
  def index
    @products = Product.all
  end
end


