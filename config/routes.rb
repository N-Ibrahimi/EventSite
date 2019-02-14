Rails.application.routes.draw do


  root :to => 'events#index'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'team', to: 'static_pages#team', as: 'team'
  
  resources :charges, only: [:new, :create]
  
  resources :events do 
    resources :participations, only: [:index,:show, :new, :create ]
  end
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 
