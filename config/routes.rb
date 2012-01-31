Gorgan::Application.routes.draw do
  root to: 'feed#index', as: 'feed'

  controller :auth do
    get 'auth'     => :auth
    get 'callback' => :callback
  end

end
