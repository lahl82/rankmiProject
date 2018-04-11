Rails.application.routes.draw do
  resources :areas do
    resources :dependencys
  end
end
