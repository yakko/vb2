class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_cart
  
  def current_cart
    return Cart.new unless session[:cart_id]
    Cart.where(:id=>session[:cart_id]).includes(:cart_products=>:product).first || Cart.new
  end
  
end
