Rails.application.routes.draw do
  resources :projects, only: [ :index, :show ]

  devise_for :users
  get "welcome/index"

  get "up" => "rails/health#show", as: :rails_health_check

  root "welcome#index"

  namespace :admin do
    resource :profile

    resources :skills do
      patch :reorder, on: :collection
    end

    resources :projects do
      delete :destroy_image, on: :member
    end
  end
end
