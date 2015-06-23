Rails.application.routes.draw do
  get 'input/index'

  root 'input#index'

  match 'input', to: 'input#create', via: [:post]
end
