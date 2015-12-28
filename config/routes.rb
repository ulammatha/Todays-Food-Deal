TodaysFoodDeals::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"}



  root to: "deal#index"
  get 'about', :to => 'about#about', :as => 'about'
  get 'contact', :to => 'about#contact', :as => 'contact'
  get 'terms', :to => 'about#terms', :as => 'terms'

  resources :deal, only: [:index, :show]
  resources :eatery, only: [:index, :new, :create, :edit, :update] do

  end
  resources :left_navigation
  resources :charges, only: [:create]
  resources :purchase, only: [:index] do
    resources :review, only: [:new, :create]
  end
  resources :vendor_deal, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :coupon_redemption, only: [:index, :update]
  resources :twitter_users, only: [:create]
end
