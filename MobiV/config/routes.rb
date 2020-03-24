Rails.application.routes.draw do
  
  root 'main#home'

  get '/about' => 'main#about'
  get '/products' => 'main#products'
  get '/contact' => 'main#contact'

  get '/signin' => 'register#signin'
  get '/signup' => 'register#signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
