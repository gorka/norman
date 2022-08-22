Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: %i( index show ) do
    collection do
      get :search
    end

    resources :views, shallow: true
  end

  resources :views, only: %i( index )

  root "views#index"
end
