Rails.application.routes.draw do
  
  devise_for :admins
  get 'cart/index'

  devise_for :users
  get '/home' => 'main#home'
  get '/contact' => 'main#contact'
  get '/about' => 'main#about'

get '/cart/clear', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'

  root :to => "main#home"
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
