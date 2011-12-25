class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :amount,          :default => 0
      t.decimal :total_price_old, :default => 0, :precision => 8, :scale => 2
      t.decimal :total_price_now, :default => 0, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
