class Product < ActiveRecord::Base
  validates :name, :presence=>true
  
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
