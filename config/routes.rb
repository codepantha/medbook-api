Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    resources :doctors, only: [:index, :show, :create, :destroy]
  end

  namespace :v1 do
    resources :users, only: [:index, :show, :create]
  end
end
