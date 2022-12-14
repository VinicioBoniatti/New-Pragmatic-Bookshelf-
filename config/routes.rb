Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login'=> :create
    delete 'logout' => :destroy
  end
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  
  resources :products do 
    get :who_bought, one: :member
  end

  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_itens
    resources :carts
    root 'store#index', as: 'store_index'
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
