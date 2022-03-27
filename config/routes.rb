Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    get 'doctors/', to: 'doctors#index'
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :appointments
      end
    end
  end
end
