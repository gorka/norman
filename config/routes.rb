Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: %i( index show ) do
    collection do
      get :search
    end
  end

  root "movies#index"
end
