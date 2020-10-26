Rails.application.routes.draw do
  resources :notes do
    collection do
      post :confirm
    end
  end
end
