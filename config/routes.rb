Rails.application.routes.draw do

  get 'foods/index'

  root to: 'foods#index'

  resources     :users,        except:[:index] do
    resources   :lists,        except:[:index], shallow: true do
      resources :list_entries, only:[:show, :create, :destroy, :update]
    end
  end

  resources     :foods,        only:[:show, :index] do
    collection { post :import }
    get :autocomplete_food_name, :on => :collection
  end

  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

  match "*path", to: 'application#page_not_found', via: :all
  
end
