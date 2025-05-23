Rails.application.routes.draw do
  resource :session
  resource :registration, only: %i[new create]
  resources :passwords, param: :token
  resources :projects, only: %i[index show update] do
    resources :comments, only: [ :create ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root "projects#index"
end
