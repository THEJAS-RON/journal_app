Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  
  # root "posts#index"
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  resources :journals
  resources :journals do
    get 'public/:public_link', to: 'journals#public_show', as: :public_show, on: :collection
  end

  root 'journals#index'
  get 'journals/public/:public_link', to: 'journals#public_show', as: :public_journal

end
