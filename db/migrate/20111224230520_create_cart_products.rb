class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.references :cart
      t.references :product
      t.integer :amount,    :default => 0
      t.decimal :price_old, :default => 0, :precision => 8, :scale => 2
      t.decimal :price_now, :default => 0, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :cart_products, :cart_id
    add_index :cart_products, :product_id
  end
end
