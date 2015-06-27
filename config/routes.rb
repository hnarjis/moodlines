Rails.application.routes.draw do
  devise_for :users
  get 'input/index'

  root 'input#index'

  match 'input', to: 'input#create', via: [:post]
end
