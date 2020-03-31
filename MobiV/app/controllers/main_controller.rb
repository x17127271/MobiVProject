class MainController < ApplicationController
  def home
    @products = Product.all
  end

  def contact
  end

  def about
  end
end
