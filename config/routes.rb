Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :doctors, only: [:index, :show, :create, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :appointments
      end
    end
  end
end
