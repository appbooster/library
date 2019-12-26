Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
