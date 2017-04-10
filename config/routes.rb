Rails.application.routes.draw do
  
  root to: 'application#home'

  resources :users,   except: [:index] do
    resources :lists, except: [:index]
  end

  match "*path", to: 'application#page_not_found', via: :all
  
end
