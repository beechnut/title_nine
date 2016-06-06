Rails.application.routes.draw do

  jsonapi_resources :cases, only: [:show]
  # root 'welcome#index'
end
