Rails.application.routes.draw do
  # Adding omniauth_openid_connect
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  # resource :session
  # resources :passwords, param: :token
  resources :catalogs
  # adding oauth controller
  # resources :oauth, param: :provider, controller: "oauth", only: :show do
  # get :callback, on: :member
  # end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "application#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

# Rails.application.routes.draw do
#   resource :session
#   resources :passwords, param: :token
#   resources :catalogs
# end


