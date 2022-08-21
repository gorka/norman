Rails.application.routes.draw do
  resources :movies, only: %i( index show ) do
    collection do
      get :search
    end
  end

  root "movies#index"
end
