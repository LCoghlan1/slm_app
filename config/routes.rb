Rails.application.routes.draw do
  
resources :employees do
  resources :absences 
end

  
resources :absences 
  
get 'absences/image', to: 'absence#image'
  
  
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
