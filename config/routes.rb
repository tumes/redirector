Redirector::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'redirects#new'

  resources :redirects, only: [:create, :show]

  resources :shortened_urls, only: [:show], path: 'r', as: 'shortened'
end
