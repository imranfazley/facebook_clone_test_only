Rails.application.routes.draw do

resources :users
resources :statuses

get '/welcome' => "welcome#index"

end
