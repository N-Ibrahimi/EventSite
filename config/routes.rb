Rails.application.routes.draw do


  get '/', to: 'home#index', as: "root"
  get 'home_secret', to: 'home#secret', as: "home_secret"
  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
