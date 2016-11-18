Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:new, :index, :create, :show, :update] do
    resources :doses, only: [:new, :create, :destroy]
  end
  # resources :doses, only: :destroy
  root to: "cocktails#index"
  mount Attachinary::Engine => "/attachinary"
end
