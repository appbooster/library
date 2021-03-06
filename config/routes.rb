Rails.application.routes.draw do
  get 'static/index'
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/auth/google_oauth2/callback", to: "api/v1/sessions#create_with_google"

  namespace :api do
    namespace :v1 do
      post "/login", to: "sessions#create"

      resource :profile, only: :show

      resources :books, except: %i[new edit update destroy] do
        collection do
          get :search
        end

        member do
          post :take
          post :give_back
          post :subscribe
          post :unsubscribe
        end

        resources :reviews, only: :create
        resources :tags, only: [] do
          collection do
            post :add
            post :remove
          end
        end
      end

      resources :tags, only: :index
    end
  end
end
