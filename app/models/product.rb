class Product < ActiveRecord::Base
  has_many :cart_products
  validates :name, :presence=>true
  validates :price_now, :numericality=>{:greater_than => 0}
  
  has_attached_file :img,
                    :url => "/files/products/:id/:filename",
                    :path => ":rails_root/public/files/products/:id/:filename",
                    :styles => {:original => "500x500>"}
  
  validates_attachment_size :img, :less_than => 10.megabytes
  validates_attachment_presence :img
  
  def price
    price_now
  end
  
end
