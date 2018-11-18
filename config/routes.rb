Rails.application.routes.draw do
 mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 mount Ckeditor::Engine => '/ckeditor'
 devise_for :users, 
 			:controllers => 
 				{
 					:registrations => "users/registrations", 
 				    :sessions => "users/sessions",
 				    :omniauth_callbacks => "omniauth_callbacks",
 				    :passwords => "users/passwords"
 				}, 
 			:path =>"",
 			:path_names =>
 				 {
 				 	:sign_in  => 'login',
 				 	:sign_out => 'logout',
 				 	:sign_up  => 'sign_up'
 				 }
 resources :doubts do
    get :components_editors, on: :collection
 end
 resources :search
 resources :opinions
 resources :posts, only: [:show, :index] do 
 	resources :comments
 end

 resources :profile do
 	post :prefrences, on: :collection
 end
 get '/text',to: 'awesome#text'
 get '/image_slider', to: 'awesome#image_slider'
 root 'awesome#show'
end
