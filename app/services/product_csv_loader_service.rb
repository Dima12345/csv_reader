class ProductCsvLoaderService
  def initialize(csv_path = "data/MOCK_DATA.csv", product_ids = [])
    @csv_path = csv_path
    @product_ids = product_ids
  end

  def call
    load_products
    remove_unnecessary_products
  end

  private

  def load_products
    CSV.foreach(@csv_path).with_index do |row, i|
      next if i == 0
      params = transform_params(row)
      update_or_create_product!(params)
    end
  end

  def transform_params(row)
    { name: row[0],
      photo_url: row[1],
      barcode: row[2],
      price_cents: row[3],
      sku: row[4],
      producer: row[5] }
  end

  def update_or_create_product!(params)
    product = Product.find_or_initialize_by(sku: params[:sku])
    product.update_attributes!(params)
    product.save!
    @product_ids << product.id
  end

  def remove_unnecessary_products
    Product.where.not(id: @product_ids).delete_all
  end
end
