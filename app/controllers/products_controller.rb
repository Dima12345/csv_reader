class ProductsController < ApplicationController
  def index
    products = Product.ransack(producer_eq: params[:producer]).result(distinct: true)
    products = paginate products, per_page: params[:per_page], page: params[:page]
    responce = { json: { products: products }, each_serializer: ::ProductsSerrializer }
    render responce
  end

  swagger_controller :products, 'ProductsController'

  swagger_api :index do
    summary 'Article'
    param :query, 'per_page', :integer, :requires, 'Per page'
    param :query, 'page', :integer, :requires, 'Page number'
    param :query, 'producer', :string, :optional, 'Producer'
    response :ok
  end
end
