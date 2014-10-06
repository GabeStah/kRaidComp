Kraidcomp::Application.routes.draw do
  root 'static_pages#index', via: [:get, :post]

  #resources :spells, only: [:index], via: [:get, :post]

  match 'spells', to: 'spells#index', via: [:get, :post]

end
