Rails.application.routes.draw do
  devise_for :users
  get '/home' => 'main#home'
  get '/contact' => 'main#contact'
  get '/about' => 'main#about'
  root :to => "main#home"

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
