Rails.application.routes.draw do
  
  use_doorkeeper
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/home'
  root to: "pages#home"
  devise_for :users
  get '/patient1' => 'patient1#list'
  get 'patient1/new'
  get 'patient1/new1'

  post 'patient1/create'
  post 'patient1/create1'

  patch 'patient1/update'
  patch 'patient1/update1'

  get 'patient1/list'
  get 'patient1/list1'

  get 'patient1/show'

  get 'patient1/edit'
  get 'patient1/edit1'

  get 'patient1/delete'
  get 'patient1/delete1'

  get 'patient1/update'
  get 'patient1/update1'
  
  get 'patient1/show_doctor'
  get 'patient1/show_doctor1'

  namespace :api do
    namespace :v1 do
    
    resources :patient1
    resources :doctor
    resources :user
    
    get 'patient1/delete1'
    get 'patient1/delete'
  
    get 'patient1/list'
    get 'patient1/list1'
    patch 'patient1/update1'
    end
  end
end
