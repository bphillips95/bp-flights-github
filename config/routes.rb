Rails.application.routes.draw do
  # root 'application#index'
  root 'tickets#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  resources :passengers
  resources :flights
  get '/tickets/destinations' => "tickets#choose_destination"
  get '/tickets/passengers' => "tickets#choose_passenger"
  get '/tickets/flights'  => "tickets#choose_flight"
  get '/tickets/checkout'  => "tickets#check_out"
  post "/tickets/checkout" => "tickets#create"
  get '/tickets/booked' => 'tickets#booked'
  get '/tickets/your_ticket' => 'tickets#confirmation'
  post "/tickets/created_passengers" => "tickets#create_passenger"
  get '/info' => 'application#index'
  resources :tickets
  
  resources :destinations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
