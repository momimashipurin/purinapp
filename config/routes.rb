Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # Public側の記述
  root 'public/homes#top'
  get 'about', to: 'public/homes#about'
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete 'clear', on: :collection
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'check'
        get 'out'
      end
    end
    resources :items, only: [:index, :show]
  end

  # Admin側の記述
  get 'admin', to: 'admin/homes#top'
  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

end
