class ApplicationController < ActionController::Base
   before_action :set_initial_cart_values
    
   def set_initial_cart_values 
      if(session[:total_cart_price] == nil || session[:total_items] == nil)
         session[:total_cart_price] = 0.00
         session[:total_items] = 0
      end
   end

end
