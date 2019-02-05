class ProductsSerrializer < ActiveModel::Serializer
  attributes :name, :photo_url, :barcode, :price_cents, :sku, :producer
end
