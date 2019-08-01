Rails.application.routes.draw do
  resources :comments
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :subs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session




  root to: redirect('/subs')
end
