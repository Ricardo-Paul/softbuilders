Rails.application.routes.draw do
  devise_for :users
  scope '/api/v1' do
    resources :users, :only => [:index, :create, :show, :update, :destroy]
  end
end
