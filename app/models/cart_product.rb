class CartProduct < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  
  def total_price_now
    amount * price_now
  end
  
  def total_price_old
    amount * price_old
  end
  
  def price_now_cents
    (100 * price_now).to_i
  end
  
end
