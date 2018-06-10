Rails.application.routes.draw do

  get 'admin/home'
  devise_for :admins
  get 'admin_products/index'

  # get 'basket/index'

  devise_for :users
  root to: "home#index"  #home controller, index action (method)

  resources :categories do
    resources :products
  end

  resources :products do
    resources :comments
  end

  resources :products do
    resources :orders
  end


  # get '/histories/', to: 'histories#create'
  resources :tables

  resources :orders do

    # post 'set_table/:table_id', action: :set_table
    collection do
      post 'set_table/:table_id', action: 'set_table'
      get :choose_table
    end
  end
  resources :histories
  resources :customers
  resources :staffs
  resources :criterions

  resources :customers do
    resources :orders
  end


  resources :admin

  resources :admin_products

  resources :office

  resources :download
  # get 'admin_products/update'

  resources :products do
    collection { post :import }
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
