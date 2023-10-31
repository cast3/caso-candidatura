Rails.application.routes.draw do
  # concern :buscarable do
  #   get 'buscar', on: :member
  # end

  # resources :periods, concerns: :buscarable
  # resources :candidatures, concerns: :buscarable
  # resources :municipalities, concerns: :buscarable
  # resources :parties, concerns: :buscarable
  # resources :candidates, concerns: :buscarable

  resources :periods, :candidatures, :municipalities, :parties, :candidates do
    collection do
      get 'buscar'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "candidatures#menu"
end
