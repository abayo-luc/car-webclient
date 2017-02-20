Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/cars", to:'cars#index'
  get "/cars/new", to:'cars#new'
  post "/cars", to:'cars#create'
  get "/cars/:id", to:'cars#show'
  get "/cars/:id/edit", to:'cars#edit'
  patch "/cars/:id", to:'cars#update'
  delete "/cars/:id", to:'cars#destroy'
end
