Rails.application.routes.draw do
  root 'urls#home'

  get '/pass' => 'urls#pass'
  get '/rand' => 'urls#rand'

end
