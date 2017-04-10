Rails.application.routes.draw do
  
  root to: 'application#home'

  resources :users,   except: [:index] do
    resources :lists, except: [:index]
  end

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

  match "*path", to: 'application#page_not_found', via: :all
  
end
