Rails.application.routes.draw do
  
  resources :documents
  get 'admin/new'
  get 'admin/create'
  devise_for :admins
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  get 'users/update'
  
resources :employees do
  resources :absences 
end

resources :documentation
resources :messages

resources :absences do
  collection { post :import }
end
  
get 'absences/image', to: 'absence#image'
  
  
devise_for :users, :controllers => { :registrations => 'registrations'}
resources :users, except: :create
resources :manager

post 'create_user' => 'users#create', as: :create_user    
root 'home#index'

end
