Rails.application.routes.draw do
  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
  get :products, to: 'products#index'
end
