Rails.application.routes.draw do
  root 'starships#index'
  resources :starships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
