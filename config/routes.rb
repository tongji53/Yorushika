Rails.application.routes.draw do
  root "arts#index"
  resources :arts
end
