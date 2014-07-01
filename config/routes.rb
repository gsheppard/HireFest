Rails.application.routes.draw do
  get '/', to: 'jobs#index'
  get '/refresh', to: 'jobs#refresh'
  get '/seekers', to: 'seekers#index'
end
