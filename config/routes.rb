Rails.application.routes.draw do
  devise_for :users
  scope '/api/v1' do
    resources :users
    resources :projects
  end
end
