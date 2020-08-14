Rails.application.routes.draw do
  resources :events

  get '/filtered-events', to: 'filtered_events#index'
  get '/', to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
