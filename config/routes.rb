Rails.application.routes.draw do
  namespace :admin do
    get 'order_details/update'

    get 'orders/show'
    get 'orders/update'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'

    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'

    get 'itemes/index'
    get 'itemes/new'
    get 'itemes/create'
    get 'itemes/show'
    get 'itemes/edit'
    get 'itemes/update'

    get 'homes/top'
  end

  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/clear'
    get 'cart_items/create'

    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'

    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'

    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/check'
    get 'customers/out'

    get 'items/index'
    get 'items/show'

    get 'homes/top'
    get 'homes/about'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
