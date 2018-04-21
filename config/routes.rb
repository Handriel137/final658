Rails.application.routes.draw do
  resources :characters do
    resources :items
  end
end