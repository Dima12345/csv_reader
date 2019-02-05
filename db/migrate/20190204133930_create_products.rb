class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :photo_url
      t.string :barcode
      t.integer :price_cents
      t.string :sku, uniqueness: true
      t.string :producer
      t.timestamps
    end

    add_index :products, :sku
    add_index :products, :producer
  end
end
