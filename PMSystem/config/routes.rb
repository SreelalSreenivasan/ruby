Rails.application.routes.draw do
  get 'login/l_index'
  get 'shownotification/open'

  get 'notification/new'
  get 'notification/eligible'
  resources :registrations
  resources :sregister
  resources :rregister
  resources :addadmin
  resources :manage_user
  resources :placementrecords
  resources :message	
  resources :notification
  resources :shownotification
  resources :manage_recruiter
 
  get 'welcome/index'

  get 'message_inbox' => 'message#inbox'

  get 'message_inbox2' => 'message#inbox2'
  get 'message_acompose' => 'message#acompose'
  
  get 'message_rcompose' => 'message#rcompose'
  
  post 'message_acompose' => 'message#create'
  
  post 'message_rcompose' => 'message#rcreate'

  get 'message_show' => 'message#reply'
  post 'message_reply' => 'message#replymessage'
  
  get 'message_show' => 'message#show'
  get 'message_show2' => 'message#show2'
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
  get 'show1' => 'placementrecords#show1' 
  get 'show2' => 'placementrecords#show2' 
  get 'show3' => 'placementrecords#show3' 
  get 'apply' => 'shownotification#apply'
  get 'mrshow' => 'manage_recruiter#show'
  get 'mrshow2' => 'manage_recruiter#sshow'
  get 'mrshow3' => 'manage_recruiter#rshow'	
  root 'login#l_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
