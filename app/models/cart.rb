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
    #validations
    product_id = product_id.to_s
    save if new_record?
    #attempts to alter quantity
    cart_products.each do |cp|
      if cp.product_id.to_s == product_id
        cp.amount += 1
        cp.save
        return cp
      end
    end
    #if product exists and hasn't been added, finally add it
    return nil unless product = Product.find(product_id) rescue nil
    r = cart_products.create :product_id => product_id,
                             :price_old  => product.price_old,
                             :price_now  => product.price_now,
                             :amount     => 1
    save
    r
  end
  
  #deletes an item from cart and returns it, returns false if it wasn't there
  def del(cart_product_id)
    #validations
    cart_product_id = cart_product_id.to_s
    #attempts to delete from collection
    cart_products.each do |cp|
      if cp.id.to_s == cart_product_id
        cart_products.delete(cp)
        save
        return cp
      end
    end
    #if product wasn't in the collection, returns false as a sign of failure
    false
  end
  
  before_save do
    #restricts to positive amounts in cart items
    cart_products.each { |cp| cart_products.delete(cp) if cp.amount <= 0 }
    #caches amount information
    self.amount = self.cart_products.map(&:amount).sum
  end
end
