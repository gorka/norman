Rails.application.routes.draw do
  devise_for :users

  resources :books do
    resources :reads, shallow: true
  end

  resources :reads, only: %i( index)

  resources :movies, only: %i( index show ) do
    collection do
      get :search
    end

    resources :views, shallow: true
  end

  resources :views, only: %i( index )

  root "views#index"
end
