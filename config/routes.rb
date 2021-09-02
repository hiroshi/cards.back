Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/cards')
  get    '/cards' => 'cards#index'
  post   '/cards' => 'cards#create'
  # get    '/cards/new' => 'cards#new'#, as: :new_card
  get    '/card/:id' => 'cards#show', as: :card
  delete '/card/:id' => 'cards#destroy'
  # patch  '/card/:'

  get  '/login' => 'sessions#new'
  get  '/auth/google_oauth2/callback' => 'sessions#create'
end
