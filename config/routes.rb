Rails.application.routes.draw do
  devise_for :users
  scope '/api/v1' do
    resources :users, :only => [:index, :create, :show, :update, :destroy]
    resource :sessions, :only => [:create, :destroy]
    resources :projects
    resources :companies
    resources :contributors
    get 'picture/:id', to: "users#getpicture"
    get 'profile', to: "users#fetch"
    post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'
    put '/upload/:id' => 'users#upload'
    

    get 'myprojects', to: "users#getMyProjects"
  end
end
