class MainController < ApplicationController
  def home
    @products = Product.where(category: 'Scooters')
    @accessories = Product.where(category: 'Accessories')
  end

  def contact
  end

  def about
  end
end
