class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :text
      t.decimal :price_now,  :default => 0, :precision => 8, :scale => 2
      t.decimal :price_old,  :default => 0, :precision => 8, :scale => 2
      t.boolean :is_hidden,  :default => true
      t.boolean :is_special, :default => false

      t.timestamps
    end
  end
end
