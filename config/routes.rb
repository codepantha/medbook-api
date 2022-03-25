Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    get 'doctors/', to: 'doctors#index'
  end

  namespace :v1 do
    get '/users', to: 'users#index'
    get '/users/create', to: 'users#create'
  end
end
