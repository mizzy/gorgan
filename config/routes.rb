Gorgan::Application.routes.draw do
  root to: 'feed#index', as: 'feed'

  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure',            :to => 'sessions#failure'
end
