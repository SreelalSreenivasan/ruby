Rails.application.routes.draw do
  get 'login/l_index'
  
  resources :registrations
  resources :sregister
  resources :rregister
  get 'welcome/index'
  get 'login'=>'login#l_index' 
  get 'recr'=>'login#recruiter'  
  get 'record'=>'login#p_records'  
  get 'contact'=>'login#contact'  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
