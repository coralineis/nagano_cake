Rails.application.routes.draw do
  scope module: :public do
    devise_for :customers, skip: [:password], controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions"
    }

    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :cart_items, only: [:create, :index, :update, :destroy, :destroy_all]
    resources :orders, only: [:new, :confirm, :complete, :complete, :create, :index, :show]
    resources :order_details, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
