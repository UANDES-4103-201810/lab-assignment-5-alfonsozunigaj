Rails.application.routes.draw do
  post '/user_ticket' => 'user_ticket#create'

  delete '/user_ticket' => 'user_ticket#destroy'

  put '/user_ticket' => 'user_ticket#update'

  get '/user_ticket' => 'user_ticket#show'

  post '/tickets' => 'tickets#create'

  delete '/tickets' => 'tickets#destroy'

  put '/tickets' => 'tickets#update'

  get '/tickets/:id' => 'tickets#show'

  post '/places' => 'places#create'

  delete '/places' => 'places#destroy'

  put '/places' => 'places#update'

  get '/places/:id' => 'places#show'

  post '/events' => 'events#create'

  delete '/events' => 'events#destroy'

  put '/events' => 'events#update'

  get '/events/:id' => 'events#show'

  post '/users' => 'users#create'

  delete '/users' => 'users#destroy'

  put '/users' => 'users#update'

  get '/users/:id' => 'users#show'

  get '/users/more_tickets_bought' => 'users#more_tickets_bought'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
