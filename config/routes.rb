Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :update, :destroy, :destroy_all]
    resources :orders, only: [:new, :confirm, :complete, :complete, :create, :index, :show]
    resources :order_details, only: [:index, :edit, :create, :update, :destroy]
  end
  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:password], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
