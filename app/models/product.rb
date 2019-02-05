class Product < ActiveRecord::Base
  validates :name, :barcode, :price_cents, presence: true
  validates :sku, uniqueness: true, presence: true
end
