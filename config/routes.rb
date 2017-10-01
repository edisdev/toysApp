Rails.application.routes.draw do


devise_for :users

resources :toys do
 resources :reservations
end

resources :users do

  resources :messages do
  end
end

resources :reservations , only: [:index ] do
  collection do
    post 'reservations/res_onay'
    post 'reservations/res_red'
  end
end

resources :messages

  root to:"toys#index"

get '/mytoys', to: 'toys#mytoys'

end
