Rails.application.routes.draw do
  
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

resources :messages

resources :absences 
  
get 'absences/image', to: 'absence#image'
  
  
devise_for :users, :controllers => { :registrations => 'registrations'}
resources :users, except: :create
resources :manager

post 'create_user' => 'users#create', as: :create_user    
root 'home#index'

end
