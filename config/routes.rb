Rails.application.routes.draw do

  namespace :api, as: :nil, defaults: { format: :json } do
    namespace :v1 do
      root to: 'home#home'
      resources :weeks, only: [:index, :show]
      resources :days, only: [:index, :show]
      resources :day_running_exercises, only: [:index, :show, :update]
      resources :running_exercises, only: [:show]
    end
  end
end
