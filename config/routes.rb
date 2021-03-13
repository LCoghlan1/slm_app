Rails.application.routes.draw do
  
  resources :employees do
    collection do
      match 'search' => 'employees#search', via: [:get, :post], as: :search
    end
  end

  
  resources :absences do
    collection do
    match 'search' => 'absences#search', via: [:get, :post], as: :search
    end
  end
  
  
  
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
