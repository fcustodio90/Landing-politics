Rails.application.routes.draw do
  get 'politicians/index'
  get 'politicians/show'

  root 'politicians#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
