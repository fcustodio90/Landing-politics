Rails.application.routes.draw do
  get 'politicians/index'

  get 'politicians/:id', to: 'politicians#show', as: 'politician'

  get 'politicians/:id/lock', to: 'politicians#lock', as: 'lock'

  get 'politicians/:id/unlock', to: 'politicians#unlock', as: 'unlock'

  root 'politicians#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
