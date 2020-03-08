Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      jsonapi_resources :groups
      jsonapi_resources :subgroups
      jsonapi_resources :namesets
      jsonapi_resources :names
    end
  end
  
end
