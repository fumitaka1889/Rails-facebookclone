Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :notes do
    collection do
      post :confirm
    end
  end
end
