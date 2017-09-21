Rails.application.routes.draw do
  get 'login/l_index'
  
  resources :registrations
  resources :sregister
  resources :rregister
  resources :addadmin
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
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
