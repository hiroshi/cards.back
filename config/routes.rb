Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get  '/cards' => 'cards#index'
  post '/cards' => 'cards#create'
  get  '/cards/new' => 'cards#new', as: :new_card
end
