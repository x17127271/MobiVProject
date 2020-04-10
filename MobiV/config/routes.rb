Rails.application.routes.draw do
  
  root :to => "main#home"
  
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'


  resources :orders do 
    resources:orderitems
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  

  get 'cart/index'

  devise_for :users do 
    resources :orders 
  end

  get '/home' => 'main#home'
  get '/shop' => 'main#shop'
  get '/contact' => 'main#contact'
  get '/about' => 'main#about'
  get '/checkout' => 'cart#createOrder'
  get '/paid/:id' => 'main#paid'
  
  
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/increase/:id' => 'cart#increase'

  
  resources :products

  post '/search' => 'products#search'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
