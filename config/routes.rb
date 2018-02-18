Rails.application.routes.draw do
  resources :students

  resources :teachers
  resources :assignments

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'welcome#index'

  get '/:u_id/:a_id/user_status' => 'assignments#user_status', as: 'user_status'
  post '/:u_id/:a_id/create_comment' => 'assignments#create_comment', as: 'create_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
