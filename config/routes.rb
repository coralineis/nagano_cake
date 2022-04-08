Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    devise_for :customers, skip: [:password], controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, only: [:edit, :update]
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    get 'orders/complete' => 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    resources :addresses, except: [:new, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
