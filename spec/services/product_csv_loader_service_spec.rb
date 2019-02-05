require 'rails_helper'

RSpec.describe ProductCsvLoaderService do
  context '#call' do
    it 'should create products' do
      expect { ProductCsvLoaderService.new.call }.to change { Product.count }.by(CSV.read('data/MOCK_DATA.csv').size - 1)
    end
  end
end