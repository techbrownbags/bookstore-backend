Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors do
        resources :books
      end
    end
    namespace :v2 do
      resources :authors do
      resources :books
    end
    end
  end
  root to: 'authors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
