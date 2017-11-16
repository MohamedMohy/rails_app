Rails.application.routes.draw do
  
 
  delete "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get 'students/change_dep_id' => 'students#change_dep_id', :as => 'change_dep_id'
  root :to => "departments#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :departments
 resources :students
 resources :sessions
 resources :courses
end
