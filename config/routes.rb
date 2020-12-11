Rails.application.routes.draw do


  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: 'omniauth'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/famous_user'=> 'users#famous_user'

  resources :users do
    resources :post_comments
    resources :posts


  end

  resources :post_comments
  get 'posts'=> 'posts#all'

  root to: "application#home"

end
