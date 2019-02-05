require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "get list of products" do
    let!(:product) { FactoryBot.create(:product) }

    it 'should call command with correct arguments' do
      get :index, params: { page: 1, per_page: 1 }
      expect(JSON.parse(response.body)["products"].count).to eq(1)
    end
  end
end
