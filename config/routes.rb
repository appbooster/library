Rails.application.routes.draw do
  get 'static/index'
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/auth/google_oauth2/callback", to: "api/v1/sessions#create"

  namespace :api do
    namespace :v1 do
      resources :books, except: %i[new edit update destroy] do
        collection do
          get :search
        end
      end
    end
  end
end
