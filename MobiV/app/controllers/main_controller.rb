class MainController < ApplicationController
  def home

    @order = Order.last
    if(@order != nil)
      @orderNumber = @order.id
    end
      update_last_login
   
    
   
  end

  def contact
  end

  def shop
    @products = Product.where(category: 'Scooters')
    @accessories = Product.where(category: 'Accessories')
  end

  def about
  end

  def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email} with Paypal")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
  end

  def paid
    # redirect_to "/cart/clear"    
    @order = Order.find_by(id: params[:id])
    @order.update_attribute(:status , "Paid by User: #{current_user.email} with PayPal")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
  end  

  def update_last_login
    if (current_user.present?) && (current_user.last_login != Date.today)
      current_user.update_column(:last_login, Date.today)
    end
  end

end
