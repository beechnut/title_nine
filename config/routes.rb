Rails.application.routes.draw do

  jsonapi_resources :cases, only: [:index, :show]
  # root 'welcome#index'
end
