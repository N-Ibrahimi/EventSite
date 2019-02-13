Rails.application.routes.draw do


  get '/', to: 'events#index', as: "root"
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'team', to: 'static_pages#team', as: 'team'
  
  resources :charges, only: [:new, :create]
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 
