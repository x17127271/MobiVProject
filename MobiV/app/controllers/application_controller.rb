class ApplicationController < ActionController::Base
   before_action :set_initial_cart_values, :set_purchases
    
   def set_initial_cart_values 
      if(session[:total_cart_price] == nil || session[:total_items] == nil)
         session[:total_cart_price] = 0.00
         session[:total_items] = 0
      end
   end

   def set_purchases
      if (current_user.present?)
         @orders = Order.where(user_id: current_user.id)
         @orders = @orders.where("status like ?","%Paid by%")
         session[:purchases] = @orders
      end
   end

end
