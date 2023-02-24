Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create] #we nest because we id from the lists GET "lists/42/bookmarks/new" # POST "lists/42/bookmarks"
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
