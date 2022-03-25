Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    get 'doctors/', to: 'doctors#index'
  end
end
