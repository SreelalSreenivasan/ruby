Rails.application.routes.draw do
  get 'login/l_index'
  
  resources :registrations
  resources :sregister
  resources :rregister
  resources :addadmin
  resources :manage_user
  get 'welcome/index'
  get 'logout'=>'login#logout'
  get 'shome'=>'login#shome'
  get 'rhome'=>'login#rhome'
  get 'ahome'=>'login#ahome'
  get 'login'=>'login#l_index'
  post 'login'=>'login#create' 
  get 'recr'=>'login#recruiter'  
  get 'record'=>'login#p_records'  
  get 'contact'=>'login#contact'
  get 'approve'=>'manage_user#approve'
  get 'current'=>'manage_user#current'
  post 'currentdata' =>'manage_user#cdata'  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
