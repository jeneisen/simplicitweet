Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/failure', to: redirect('/')

  resources :sessions

  root 'main#index'

  get 'tweets', to: 'tweets#index'
  get 'tweets/search', to: 'tweets#search', as: 'tweets_search'
  get 'tweets/list', to: 'tweets#list', as:  'tweets_list'

  delete 'tweets/mark_as_read'

	%w( 404 422 500 ).each do |code|
	  get code, controller: :application, action: :error, code: code
	end
end
