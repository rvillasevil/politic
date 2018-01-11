Rails.application.routes.draw do
  root   'static_pages#home'

  get     '/lista',     to: "users#lista"
  get     '/help',      to: 'static_pages#help'
  get     '/about',     to: 'static_pages#about'
  get     '/contact',   to: 'static_pages#contact'
  get     '/popular',   to: 'static_pages#popular'
  get     '/howtouse',   to: 'static_pages#howtouse'
  get     '/vision',    to: 'static_pages#vision'
  get     '/objetivos',    to: 'static_pages#objetivos'  
  get     '/candidate',    to: 'static_pages#candidate'   
  get     '/popular_last_day', to: 'static_pages#popular_last_day'
  get     '/signup',    to: 'users#new'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  get     '/lista',     to: "users#lista"
  get     '/circles',   to: "users#following"
  get     '/new_plaza', to: 'users#new_plaza'
  get     '/plazas',    to: 'users#following_plaza'
  get     '/petition',  to: 'microposts#petition_form'
  get     '/micropost', to: 'microposts#show'
  get     '/petitions', to: 'microposts#petition_index'
  get     '/petitions_public', to: 'microposts#petition_index_public'
  post    '/plazas',            to: 'plazas#create'
  get     '/allplazas',         to: 'plazas#all_index'
  delete  '/dejardeseguir',     to: 'groups#destroy'
  post    '/seguir',            to: 'groups#create'
  get     '/popular',           to: 'static_pages#popular'
  get     '/index_municipios',  to: 'municipios#index'
  get     '/ir_a_tu_plaza',     to: 'plazas#show'

  resources :users do
    member do
      get :following, :followers
      get :edit_administrative
      put :update_administrative
      put :update_administrative_ciudad
      put :update_circles_administrative
    end

  resources :users do
    resources :users
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :microposts do
    member do
      get :hashtag
    end
  end
  resources :microposts do
    resources :comments do
      member do
        put :create
      end
    end
    resources :votes do
      member do
        put :update_like
        put :update_dislike
        put :update_circles_adminstrative
      end
    end
  end

  resources :users do
    resources :comments
    resources :plazas
    resources :groups
  end

  resources :plazas

  resources :municipios, only: [:index]
  
  resources :relationships,       only: [:create, :destroy]
end