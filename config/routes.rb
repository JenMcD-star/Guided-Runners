Rails.application.routes.draw do
  resources :conversations do 
    resources :messages 
  end
  
  get 'sessions/new'
  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :events
  resources :relationships,       only: [:create, :destroy]

end