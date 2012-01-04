class Cart < ActiveRecord::Base
  has_many :cart_products, :dependent => :destroy
  accepts_nested_attributes_for :cart_products, :allow_destroy => true, :reject_if => :all_blank
  
  
  def total_price_now
    cart_products.map(&:total_price_now).sum
  end
  
  def total_price_old
    cart_products.map(&:total_price_old).sum
  end
  
  #adds or increases an item on cart, may return nil if product doesn't exist
  def add(product_id)
    puts "---"
    save if new_record?
    #detects
    cp = cart_products.detect { |cp| cp.product_id.to_s == product_id.to_s }
    #or builds
    cp ||= begin
      p = Product.find(product_id)
      cart_products.build(:product_id => p.id, :price_old => p.price_old, :price_now => p.price_now)
    rescue
      nil
    end
    #increases amount
    cp.amount += 1 if cp.present?
    #save
    save
    cp
  end
=begin
  #deletes an item from cart and returns it, returns false if it wasn't there
  def del(cart_product_id)
    #detects
    cp = cart_products.detect { |cp| cp.id.to_s == cart_product_id.to_s }
    #attempts to delete from collection
    cart_products.delete(cp) and save if cp
    #returns nil or the removed product
    return cp
  end
=end
  
  before_save do
    #restricts to positive amounts in cart items
    cart_products.each { |cp| cart_products.delete(cp) if cp.amount <= 0 }
    #caches amount information
    self.amount = self.cart_products.map(&:amount).sum
  end
end
