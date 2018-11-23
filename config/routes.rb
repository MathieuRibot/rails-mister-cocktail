Rails.application.routes.draw do
  root to: 'cocktails#home'
  resources :cocktails, only: %i[index show new create] do
    collection do
      get 'search', to: 'cocktails#search', as: 'search'
    end
    resources :doses, only: %i[new create]
  end
  resources :doses, only: %i[destroy]
end
