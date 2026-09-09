Rails.application.routes.draw do
  devise_for :users
  get "welcome/index"
  
  get "up" => "rails/health#show", as: :rails_health_check

  root 'welcome#index'

  namespace :admin do
    resource :profile
    resources :skills
  end
end
