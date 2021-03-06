Rails.application.routes.draw do
  
  # resources :articles do
  #   resources :comments
  # end
 
  root 'pages#home'

  # get '/home', to: 'pages#home'

  # get '/recipes', to: 'recipes#index'

  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'

  # post '/recipes', to: 'recipes#create'

  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'

  # patch '/recipes/:id', to: 'recipes#update'

  # get 'recipes/:id', to: 'recipes#show', as: 'recipes_show'

  # delete 'recipes/:id', to: 'recipes#destroy'

  resources :recipes do
    member do
      post 'like'
    end
  end

  resources :chefs, except: [:new]

  get'/register', to: 'chefs#new'


 
  #------login routes

  get '/login', to: 'logins#new'

  post '/login', to: 'logins#create'

  get '/logout', to: 'logins#destroy'

end
