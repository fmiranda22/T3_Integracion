Rails.application.routes.draw do
  get 'naves/index'

  get 'planeta/index'

  get 'personajes/index'

  get 'pelicula/index'
  root 'welcome#index'
  get '/welcome', to: 'welcome#index'
  get '/pelicula', to: 'pelicula#index'
  get '/personajesall', to: 'personajes#all'
  get '/personajes', to: 'personajes#index'
  get '/planetasall', to: 'planeta#all'
  get '/planeta', to: 'planeta#index'
  get '/naves', to: 'naves#index'
  get '/navesall', to: 'naves#all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
