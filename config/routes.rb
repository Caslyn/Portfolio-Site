Rails.application.routes.draw do
  root 'urls#home'

  get '/slow' => 'urls#slow'
  get '/down' => 'urls#down'
  get '/pass' => 'urls#pass'
end
