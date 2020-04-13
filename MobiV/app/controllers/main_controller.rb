class MainController < ApplicationController
  def home
    # get all orders for the current user to display last order number
    @order = Order.last
    @orderNumber = 0
    if(@order != nil)
      @orderNumber = @order.id
    end
    update_last_login   
  end

  def contact
  end

  def shop
    #get all scooters
    @products = Product.where(category: 'Scooters')
    #get all accessories
    @accessories = Product.where(category: 'Accessories')
  end

  def about
  end

  def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email} with Paypal")    
  end

  def paid
    # redirect_to "/cart/clear"    
    @order = Order.find_by(id: params[:id])
    @order.update_attribute(:status , "Paid by User: #{current_user.email} with PayPal")
  end  

  def update_last_login
    #update last time user log in
    if (current_user.present?) && (current_user.last_login != Date.today)
      current_user.update_column(:last_login, Date.today)
    end
  end

end
