Rails.application.routes.draw do

resources :users
resources :statuses
resources :sessions
resource :likes

get '/welcome' => "welcome#index"
get '/delete' => "sessions#destroy"
root "welcome#index"

end
